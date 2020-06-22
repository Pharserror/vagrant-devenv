require 'yaml'

SVN_CMDS = {
  git: 'git',
  mercurial: 'hg'
}

def build_package(package)
  output_to_file = %Q( echo Installing package #{package['name']}; )

  case package['cmnd']
  when 'gem'
    output_to_file += install_gem(package)
  when 'npm'
    output_to_file += install_npm(package)
  else
    output_to_file += %Q( echo "INVALID PACKAGE CMND #{package['cmnd']}"; )
  end

  output_to_file
end

def clone(item)
  %Q( #{SVN_CMDS[item['type'].to_sym]} clone https://#{item['user']}:#{item['pass']}@#{item['domain']}/#{item['name']}.#{item['type']} #{item['destination']}; )
end

def install_gem(package)
  %Q(
    echo Installing gem #{package['name']};
    rvm gemset create #{package['gemset']};
    rvm gemset use #{package['gemset']};
    cd #{package['destination']};
    gem build #{package['name']}.gemspec;
    gem install #{package['destination']}/#{package['name']}-#{package['version']}.gem;
  )
end

def install_npm(package)
end

def generate_shell_script_from_config(config_file_path)
  output = ""

  YAML.load_file(config_file_path).each do |category, items|
    case category
    when 'repos'
      items.each do |item|
        output += %Q( mkdir -p #{item['destination']}; )
        output += clone(item)

        if item.keys.include?('postinstall_packages')
          output += %q( echo "installing packages..."; )

          item['postinstall_packages'].each do |package|
            output += clone(package)
            output += build_package(package)
          end
        else
          output += %q( echo "no postinstall packages detected, moving on..."; )
        end

        if item.keys.include?('postinstall')
          output += %Q( echo Running post install for #{item['name']}; )
          output += %Q( bash #{item['postinstall']} #{item.keys.include?('postinstall_args') ? item['postinstall_args'].join(' ') : nil}; )
        end
      end
    else
      puts "don't know how to handle #{category}"
    end

    output
  end

  file = File.open('configure.sh', 'w') do |file_handle|
    file_handle.write(output)
  end
end

generate_shell_script_from_config('./config.yaml')
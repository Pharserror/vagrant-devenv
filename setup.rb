require 'yaml'

SVN_CMDS = {
  git: 'git',
  mercurial: 'hg'
}

def build_package(package)
  %x( echo Installing package #{package['name']} )
  case package['cmnd']
  when 'gem'
    install_gem(package)
  when 'npm'
    install_npm(package)
  else
    %x( echo "INVALID PACKAGE CMND" )
  end
end

def clone(item)
  %x( #{SVN_CMDS[item['type'].to_sym]} clone https://#{item['user']}:#{item['pass']}@#{item['domain']}/#{item['user']}/#{item['name']}.#{item['type']} #{item['destination']} )
end

def install_gem(package)
  %x( echo Installing gem #{package['name']} )
  %x( rvm gemset create #{package['gemset']} && rvm gemset use #{package['gemset']} )
  %x( cd #{package['destination']} && gem build #{package['name']}.gemspec )
  %x( gem install #{package['name']}-#{package['version']}.gem )
end

def install_npm(package)
end

YAML.load_file('./config.yaml').each do |category, items|
  case category
  when 'repos'
    items.each do |item|
      %x( mkdir #{item['destination']} )
      clone(item)
      if item.keys.include?('postinstall_packages')
        %x( echo "installing packages..." )
        item['postinstall_packages'].each do |package|
	  clone(package)
          build_package(package)
        end
      else
        %x( echo "no postinstall packages detected, moving on..." )
      end

      if item.keys.include?('postinstall')
        %x( echo Running post install for #{item['name']} )
        %x( sh #{item['postinstall']} #{item.keys.include?('postinstall_args') ? item['postinstall_args'].join(' ') : nil} )
      end
    end
  else
    puts "don't know how to handle #{category}"
  end
end

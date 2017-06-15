require 'yaml'

SVN_CMDS = {
  git: 'git',
  mercurial: 'hg'
}

YAML.load_file('config.yaml').each do |category, items|
  case category
  when  'repos'
    items.each do |item|
      %x( mkdir #{item['destination']} )
      %x( #{SVN_CMDS[item['type'].to_sym]} clone https://#{item['user']}:#{item['pass']}@#{item['domain']}/#{item['user']}/#{item['name']}.#{item['type']} #{item['destination']} )
      if item.keys.include?(:postinstall)
        %x( sh #{item[:postinstall]} #{item.keys.include?(:postinstall_args) ? item[:postinstall_args].join(' ') : nil} )
      end
    end
  else
    puts "don't know how to handle #{category}"
  end
end

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
      %x( sh #{item[:postinstall]} )
    end
  else
    puts "don't know how to handle #{category}"
  end
end

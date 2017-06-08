require 'yaml'

SVN_CMDS = {
  git: 'git',
  mercurial: 'hg'
}

YAML.load_file('config.yaml').each do |category, items|
  case category
  when  'repos'
    items.each do |item|
      %x[ #{SVN_CMDS[type][:command]} clone #{item[:url]} #{item[:destination]} ]
    end
  else
    puts "don't know how to handle #{category}"
  end
end

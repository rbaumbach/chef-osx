directory '/usr/local' do
  group 'admin'
  mode '0775'
end

# execute "install homebrew" do
#   command 'git clone https://github.com/Homebrew/homebrew.git /usr/local'
#   group 'admin'
#   user node['homebrew']['user']
#   not_if { File.exist? '/usr/local/bin/brew' }
# end

git '/usr/local' do
  repository 'https://github.com/Homebrew/homebrew.git'
  user node['homebrew']['user']
  group node['homebrew']['group']
end

execute "brew doctor" do
  command "brew doctor"
  user node['homebrew']['user']
  # there is no way to ignore warnings thrown by brew doctor, will nearly
  # always return a 1 and will cause chef failures
  returns [0, 1]
end

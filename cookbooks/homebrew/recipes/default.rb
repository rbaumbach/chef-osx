directory '/usr/local' do
  group 'admin'
  mode '0775'
end

git '/usr/local' do
  repository 'https://github.com/Homebrew/homebrew.git'
  user node['homebrew']['user']
  group 'admin'
end

execute "brew doctor" do
  command "brew doctor"
  user node['homebrew']['user']
  # there is no way to ignore warnings thrown by brew doctor, will nearly
  # always return a 1 and will cause chef failures
  returns [0, 1]
  not_if { File.exist? "#{Chef::Config[:file_cache_path]}/chef-homebrew.tmp" }
end

# used to indicate chef for homebrew has been run at least once
file "#{Chef::Config[:file_cache_path]}/chef-homebrew.tmp"

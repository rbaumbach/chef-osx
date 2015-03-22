directory '/usr/local/Library/Taps' do
  owner node['homebrew']['user']
  recursive true
end

execute 'tap cask' do
  command 'brew tap phinze/homebrew-cask'
  user node['homebrew']['user']
end

package 'brew-cask'

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner node['homebrew']['user']
  group 'staff'
end

directory '/opt/homebrew-cask' do
  owner node['homebrew']['user']
end

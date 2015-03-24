include_recipe 'homebrew'

execute 'tap cask' do
  command 'brew tap caskroom/cask'
  user node['homebrew']['user']
  not_if { File.exist? '/usr/local/Library/Taps/caskroom/homebrew-cask/bin/brew-cask' }
end

package 'brew-cask'

# Manually create directories so that root permissions are not needed for
# the first 'casking' of an application

directory '/opt/homebrew-cask' do
  owner node['homebrew']['user']
  group 'staff'
end

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner node['homebrew']['user']
  group 'staff'
end

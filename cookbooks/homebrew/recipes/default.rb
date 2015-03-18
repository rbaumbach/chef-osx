directory '/usr/local' do
  group 'admin'
  mode '0775'
end

execute "install homebrew" do
  command 'git clone https://github.com/Homebrew/homebrew.git /usr/local'
  # cwd '/usr/local'
  group 'admin'
  user ENV['SUDO_USER']
  not_if { File.exist? '/usr/local/bin/brew' }
end
#
# execute "change owner" do
#   command "chown -R sprout-user /usr/local/"
# end
#
# execute "doctor brew" do  # whole resource has issues.....
#   command "brew doctor"
#   user ENV['SUDO_USER']
# end

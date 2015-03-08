homebrew_repo = 'git clone https://github.com/Homebrew/homebrew.git'
homebrew_install_directory = '/usr/local'
homebrew_bin = '/usr/local/bin/brew'

directory homebrew_install_directory do
  user "root"
  group "admin"
  not_if { Directory.exists? homebrew_install_directory }
end

execute "install homebrew" do
  command "#{homebrew_repo} #{homebrew_install_directory}"
  user ENV['SUDO_USER']
  group "admin"
  not_if { File.exist? homebrew_bin }
end

execute "doctor brew" do
  command "brew doctor"
end

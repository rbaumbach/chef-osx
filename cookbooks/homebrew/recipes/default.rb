homebrew_install_directory = "/usr/local"

directory homebrew_install_directory do
  user "root"
  group "admin"
end

execute "install homebrew" do
  command "git clone https://github.com/Homebrew/homebrew.git #{homebrew_install_directory}"
  not_if { File.exist? '/usr/local/bin/brew' }
end

execute "doctor brew" do
  command "brew doctor"
end

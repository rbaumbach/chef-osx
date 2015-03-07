directory "/usr/local" do
  user "root"
  group "staff"
end

execute "install homebrew" do
  command 'https://github.com/Homebrew/homebrew.git'
  not_if { File.exist? '/usr/local/bin/brew' }
end

execute "doctor brew" do
  command "brew doctor"
end

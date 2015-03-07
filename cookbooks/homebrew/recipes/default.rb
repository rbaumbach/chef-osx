execute "install homebrew" do
  command "echo | ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  not_if { File.exist? '/usr/local/bin/brew' }
end

execute "doctor brew" do
  command "brew doctor"
end

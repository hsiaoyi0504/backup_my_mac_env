function install_brew_package() {
    echo EXECUTING: brew install $1
    brew install $1
    # [ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}

function install_brew_cask_package() {
    echo EXECUTING: brew cask install $1 $2
    brew cask install $1
    # [ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.
}

brew tap caskroom/cask

while read line
do
    install_brew_package $line
done < brew_list.txt

while read line
do
    install_brew_cask_package $line
done < brew_cask_list.txt
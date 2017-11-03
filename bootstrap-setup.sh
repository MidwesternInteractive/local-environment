#!/bin/bash

# Change to home dire
cd

# Note
printf "If you do not know the answer to any of the following questions just answer with 'n' and we\'ll handle it unless specified otherwise.\n\n"

# Install homebrew if not already
printf "\nDo you have homebrew installed? [y/n] "
read homebrew

if [ "$homebrew" == "n" ]; then
    printf "Installing Homebrew, please wait...\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install PHP if not already
printf "\nDo you have PHP installed? [y/n] "
read phpinstalled

if [ "$phpinstalled" == "n" ]; then
    printf "Installing PHP, please wait...\n"
    brew install homebrew/php/php71
fi

# Install MySQL if not already
printf "\nDo you have MySQL installed? [y/n] "
read mysqlinstalled

if [ "$mysqlinstalled" == "n" ]; then
    printf "Installing MySQL, please wait...\n"
    brew install mysql
    brew services start mysql
else
    printf "Please wait...\n"
    brew services start mysql
fi

# Install composer if not already
printf "\nHave you installed composer? [y/n] "
read composerinstalled

if [ "$composerinstalled" == "n" ]; then
    printf "Installing composer, this may take a moment, please wait...\n"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"

    printf "Making composer global..."
    mv composer.phar /usr/local/bin/composer

    printf "Adding composer to PATH, you will most likely be asked for your users password...\n"
    sudo echo $HOME/.composer/vendor/bin >> /etc/paths

    printf "Sourcing BASH...\n"
    source ~/.zshrc
    source ~/.bash_profile
    source ~/.profile
fi

printf "\nHave you installed Nope/NPM? [y/n] "
read nodeinstalled

if [ "$nodeinstalled" == "n" ]; then
    printf "Installing Node/NPM, please wait...\n"
    brew install node
fi

if [ "$composerinstalled" == "n" ]; then
    printf "Getting Valet installer, please wait...\n"
    composer gloabl require laravel/valet
else
    printf "\nHave you added the Valet installer? [y/n] "
    read valetinstaller

    if [ "$valetinstaller" == "n" ]; then
        printf "Getting Valet installer, please wait...\n"
        composer gloabl require laravel/valet
        valet install
    else
        printf "\nHave you installed valet? [y/n] "
        read valetinstalled

        if [ "$valetinstalled" == "n" ]; then
            valet install
        fi
    fi
fi

printf "\nLocal environment has been successfully set up. You may now start serving your valet sites."
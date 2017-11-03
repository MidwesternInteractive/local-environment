# Local Environment Setup
This environment only works on MacOS, sorry linux/windows users... check out [Homestead](https://laravel.com/docs/master/homestead)

__*Note*__ `$` represents a terminal command and should not be typed out.

All commands (unless otherwise specified) should be ran from home dir:
```shell
$ cd
```

  - [Walk Through](#walk-through)
    - [Clone Repository](#clone-repository)
    - [Run Script](#run-script)
  - [Update or Install Homebrew](#update-or-install-homebrew)
    - [Install](#install)
    - [Update](#update)
  - [Install PHP](#install-php)
  - [Install MySQL](#install-mysql)
  - [Install Composer](#install-composer)
    - [Download](#download)
    - [Install Globally](#install-globally)
    - [Add to your Path](#add-to-your-path)
  - [Install Node/NPM](#install-node-npm)
  - [Install Valet](#install-valet)
    - [Run Installer](#run-installer)
  - [Serve Up Your Sites](#serve-up-your-sites)
    - [Serving in a nutshell](#serving-in-a-nutshell)
    - [Park entire directory](#park-entire-directory)
    - [Link single directory](#link-single-directory)

## Walk Through
For a Walk Through of the set up you may run the bootstrap shell setup. Otherwise skip to [Update or Install Homebrew](#update-or-install-homebrew)

#### Clone Repository
```shell
$ git clone https://github.com/MidwesternInteractive/local-environment.git
```

#### Run Script
```shell
$ cd local-environment
$ sh bootstrap-setup.sh
```

## Update or Install Homebrew
```shell
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install PHP
```shell
$ brew install homebrew/php/php71
```
7.1 was latest at the time. Check for latest release or the recommended version on the [valet](https://laravel.com/docs/master/valet#installation) docs.

## Install MySQL
```shell
$ brew install mysql
$ brew services start mysql
```
You can download [Sequel Pro](https://sequelpro.com/download) and connect to your local MySQL server.

  - Host: 127.0.0.1
  - User: root

Leave everything else blank and connect.

## Install Composer
### Download
```shell
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$ php composer-setup.php
$ php -r "unlink('composer-setup.php');"
```

### Install Globally
```shell
$ mv composer.phar /usr/local/bin/composer
```

### Add to your Path
```shell
$ sudo vim /etc/paths
```

  - You can use any method of editing the file
  - Add `/users/{your-folder-name}/.composer/vendor/bin` at the bottom of the file and save
  - Quit/restart terminal

## Install Node/NPM
```shell
$ brew install node
```

## Valet Installer
```shell
$ composer global require laravel/valet
```

### Install Valet
```shell
$ valet install
```
This will most likely prompt for the root password

## Serve up your sites
Read the [valet](https://laravel.com/docs/master/valet#serving-sites) documentation on serving sites.

If you already have a pretty good size projects folder I would recommend linking your project individually OR creating a separate directory inside your projects folder specifically for valet sites.

### Serving in a nutshell
#### Park entire directory
```shell
$ cd ~/projects
$ mkdir valet && cd valet
$ valet park
```
Every directory in the newly created `valet` directory will be automatically accessible at `directory-name.dev`.

#### Link single directory
```shell
$ cd ~/projects
$ mkdir app-name && cd app-name
$ valet link app-name
```
The site will now be available at `app-name.dev`.

[Full Valet Documentation](https://laravel.com/docs/master/valet)

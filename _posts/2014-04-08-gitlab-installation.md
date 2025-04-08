---
layout: post
title: Gitlab Installation on Mac OS X
date: 2014-04-08
categories: [information technology]
tags: [design patterns]

---

## Summary

* Article Source: [Installing Gitlab on Mac OS X and Mac OS X Server](http://www.createdbypete.com/articles/installing-gitlab-on-mac-os-x-and-mac-os-x-server/)    
* Authors: [Peter Rhoades](https://plus.google.com/116964527372254202973?rel=author)



# Installing Gitlab on Mac OS X and Mac OS X Server 

[Gitlab](http://gitlab.org) is self hosted Git management software, not
only that but it's also *free and open-source*.

While Gitlab has a brilliant [installation
guide](https://github.com/gitlabhq/gitlabhq/blob/stable/doc/install/installation.md)
available, it is focused on Ubuntu/Debian and not all those instructions
carry over to OS X so after a bit of tinkering I've put together this
guide for anyone else looking to run Gitlab on OS X.

I'll be working on 10.8 (Mountain Lion) but these instructions will most
likely work on 10.7 (Lion) as well. My original install of Gitlab was on
an Xserve machine that also had [OS X
Server](http://www.apple.com/uk/osx/server/) installed so these steps
will work with that also.

#### Disclaimer

This guide has allowed me to setup Gitlab (v4.2) on a private local
network with around 10 users and nearly 200 repositories. Any serious
production use I highly recommend using system Gitlab recommends to
allow for consistent support and I accept no responsibility for any
problems you encounter while following this guide.

I have only managed to get Gitlab 4.2 working on OS X so far which uses
Gitolite so this guide will be installing Gitlab 4.2 and assumes a clean
installation of OS X.

Requirements
------------

The Gitlab team suggests at least 1GB RAM in your machine to run the
Gitlab application, since Mountain Lion requires about 2GB+ RAM you can
go ahead and tick that off the list.

### Install Command Line Tools and Homebrew

If you don't have [Homebrew](http://mxcl.github.com/homebrew/) installed
already then before you start copy & pasting into Terminal you had
better check you have [Command Line
Tools](https://developer.apple.com/downloads) installed first. Done
that? OK, time to install Homebrew.

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

    # Add Homebrew binary path to the front of the $PATH 
    echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile

    # Update some permissions for later on
    sudo chgrp -R staff /usr/local
    sudo chmod -R g+w /usr/local

A simple script that will automatically install Homebrew on your
machine, once it's done we need to check it's all working and update the
formulas.

    brew doctor # Raring to brew?
    brew update

### Packages and dependencies

We actually have most of what we need on OS X already, but we are
missing a few core packages that we'll install with Homebrew now, these
are mainly required for RVM to compile Ruby a little later on. Some of
the other packages such as MySQL and Redis I will go through separately.

    brew tap homebrew/dupes
    brew install bash curl git icu4c
    brew install autoconf automake apple-gcc42 libtool pkg-config openssl readline libyaml sqlite libxml2 libxslt libksba curl-ca-bundle

#### What's better than one Python? Two apparently!

We need to create a symlink to Python for compatibility reasons not
relating to OS X but for some other Linux distributions that are in
limbo between version 2 and 3 of Python.

    sudo ln -sv /usr/bin/python /usr/bin/python2
    python2 --version # Should be Python 2.7.X

We also need to install Pygments for colourful syntax highlighting.

    sudo easy_install Pygments

Create user accounts
--------------------

Gitolite and Gitlab need a user to operate as. In OS X you can create
this user using the GUI via System Preferences or via the command line
like we are about to do. For this example I recommend the command line
due to the extra options we need to set.

#### The Git user

Create a new group called `git` with the ID of `1050`.

    sudo dscl . -create /Groups/git
    sudo dscl . -create /Groups/git PrimaryGroupID 1050

Now we create a `git` user account with the recently created `git` group
as the primary group.

    # Check the id is available
    id 1050

    sudo dscl . -create /Users/git
    sudo dscl . -create /Users/git UserShell /bin/bash
    sudo dscl . -create /Users/git RealName "Git"
    sudo dscl . -create /Users/git UniqueID 1050
    sudo dscl . -create /Users/git PrimaryGroupID 1050
    sudo dscl . -create /Users/git NFSHomeDirectory /Users/git

    # Obviously change "mysupersecurepassword123" to something better ;)
    sudo dscl . -passwd /Users/git mysupersecurepassword123

    # Check our new Git user exists 
    dscl . -read /Users/git

    # Create home directory
    sudo createhomedir -c -u git

#### The Gitlab user

Now we have a `git` user for Gitolite, we want to create the application
user for Gitlab this time with id `1051`.

    # Check the id is available
    id 1051

    sudo dscl . -create /Users/gitlab
    sudo dscl . -create /Users/gitlab UserShell /bin/bash
    sudo dscl . -create /Users/gitlab RealName "Gitlab HQ"
    sudo dscl . -create /Users/gitlab UniqueID 1051
    sudo dscl . -create /Users/gitlab PrimaryGroupID 1050
    sudo dscl . -create /Users/gitlab NFSHomeDirectory /Users/gitlab

    # Add user to staff group so RVM can access Homebrew files later
    sudo dseditgroup -o edit -a gitlab -t user staff

    # Obviously change "mysupersecurepassword123" to something better ;)
    sudo dscl . -passwd /Users/gitlab mysupersecurepassword123

    # Check our new Git user exists 
    dscl . -read /Users/gitlab

    # Create home directory
    sudo createhomedir -c -u gitlab

    # Generate the SSH key for the gitlab user, this is used to access Gitolite
    sudo -u gitlab -H ssh-keygen -q -N '' -t rsa -f /Users/gitlab/.ssh/id_rsa

Install and setup Gitolite
--------------------------

Clone GitLab's fork of the Gitolite source code:

    cd /Users/git
    sudo -u git -H git clone -b gl-v320 https://github.com/gitlabhq/gitolite.git /Users/git/gitolite

Setup Gitolite with Gitlab as its admin. **Important Note:** GitLab
assumes *full and unshared* control over this Gitolite installation.

    # Add Gitolite scripts to $PATH
    sudo -u git -H mkdir /Users/git/bin
    sudo -u git -H sh -c 'printf "%b\n%b\n" "PATH=\$PATH:/Users/git/bin" "export PATH" >> /Users/git/.profile'
    sudo -u git -H sh -c '/Users/git/gitolite/install -ln /Users/git/bin'

    # Copy the gitlab user's (public) SSH key ...
    sudo cp /Users/gitlab/.ssh/id_rsa.pub /Users/git/gitlab.pub
    sudo chmod 0444 /Users/git/gitlab.pub

    # ... and use it as the admin key for the Gitolite setup
    sudo -u git -H sh -c "PATH=/Users/git/bin:$PATH; gitolite setup -pk /Users/git/gitlab.pub"

Fix the directory permissions for the configuration directory:

    # Make sure the Gitolite config dir is owned by git
    sudo chmod 750 /Users/git/.gitolite/
    sudo chown -R git:git /Users/git/.gitolite/

Fix the directory permissions for the repositories:

    # Make sure the repositories dir is owned by git and it stays that way
    sudo chmod -R ug+rwX,o-rwx /Users/git/repositories/
    sudo chown -R git:git /Users/git/repositories/
    sudo -u git -H find /Users/git/repositories -type d -print0 | sudo xargs -0 chmod g+s

### Add domains to the list of known\_hosts

To avoid problems later we will be manually adding the system the
known\_hosts file of the gitlab user. We will do this for a couple of
hostnames.

    # Check SSH access to your system is on
    sudo systemsetup -setremotelogin on
    sudo -u gitlab -H ssh git@localhost

That's the `localhost` added but we should also add the machines
`.local` hostname too. For server using an external FQDN you will see
that hostname returned and not a `.local`.

*By using a `.local` domain you are only able to access Gitlab on your
local network. It is possible to expand this to the outside world but
this involves opening ports on your router and mapping your external IP
address to a FQDN. All of which is outside the scope of this guide.*

    # Find out your hostname, should output your-machine-name.local
    hostname
    sudo -u gitlab -H ssh git@your-machine-name.local

### Test everything works so far

    # Clone the admin repo to be sure your users have access to Gitolite
    sudo -u gitlab -H git clone git@localhost:gitolite-admin.git /tmp/gitolite-admin

    # If it succeeded without errors you can remove the cloned repo
    sudo rm -rf /tmp/gitolite-admin

If you can't clone the `gitolite-admin` repository: **DO NOT PROCEED
WITH INSTALLATION!** Check the [Trouble Shooting
Guide](https://github.com/gitlabhq/gitlab-public-wiki/wiki/Trouble-Shooting-Guide#ssh)
and make sure you have followed all of the above steps carefully.

Install and setup MySQL Database for Gitlab
-------------------------------------------

Gitlab recommends MySQL as the datastore so we'll follow that
recommendation. You may already have MySQL installed, if you have and it
was installed using Homebrew you will just need to move the `.plist`
file from `~/Library/LaunchAgents` to `/Library/LaunchDaemons` as this
will start the service when the machine starts instead of when your user
logs in otherwise Gitlab won't be available unless you login which is
not what we want.

Run the following commands as your `sudo` capable user.

    brew install mysql

    # Some problems with permissions have been reported
    sudo chmod -R g+w /usr/loca/var/mysql 

    # Add MySQL to launchctl to let OS X manage the process and start when you login, note the LaunchDaemons location to start service when machine starts not when user logs in.
    sudo cp /usr/local/opt/mysql/*.plist /Library/LaunchDaemons
    sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.mysql.plist

    # "Secure" your MySQL installation, really it's just a handy way to clean up defaults and set a root password.
    mysql_secure_installation

    # Login to MySQL
    mysql -u root -p

    # Create a user for GitLab. (change $password to a real password)
    mysql> CREATE USER 'gitlab'@'localhost' IDENTIFIED BY '$password';

    # Create the GitLab production database
    mysql> CREATE DATABASE IF NOT EXISTS `gitlabhq_production` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;

    # Grant the GitLab user necessary permissions on the table.
    mysql> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON `gitlabhq_production`.* TO 'gitlab'@'localhost';

    # Quit the database session
    mysql> \q

    # Try connecting to the new database with the new user
    sudo -u gitlab -H mysql -u gitlab -p -D gitlabhq_production

Install and setup Redis
-----------------------

Gitlab uses the fantastic [Sidekiq](http://mperham.github.io/sidekiq/)
project to handle the scheduling of background jobs such as sending out
emails and repo management tasks. Sidekiq uses [Redis](http://redis.io/)
as a datastore so let's set that up now. We will also want Redis to
start up with the machine so we will be adding it to the `LaunchDaemons`
directory also.

    brew install redis

    sudo cp /usr/local/opt/redis/*.plist /Library/LaunchDaemons
    sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.redis.plist

This will run Redis with defaults, you can change these defaults but to
do so I recommend duplicating the defaults first so you always have a
reference. You can update
`/Library/LaunchDaemons/homebrew.mxcl.redis.plist` to the new config
location. It's also best the run Redis with `daemonize` set to `no` so
that OS X can manage the process correctly.

Install RVM and Ruby
--------------------

Before we start trying to install RVM we need to login as the right user
to make thing easier. Only the `gitlab` user will need RVM and Ruby
installed.

    su - gitlab # The hyphen is important

We will be using [RVM](https://rvm.io) to install Ruby. I'm installing
Ruby 1.9.3 as at the time of writing this is the supported version for
Gitlab. If you have any problems installing Ruby you should check
`rvm requirements` to make sure you have everything it needs installed —
this guide should remain correct but just incase.

    curl -L https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm

    rvm autolibs enable
    rvm install 1.9.3

    rvm use 1.9.3

    # Check our shell is using the correct Ruby version
    ruby -v

#### Create RVM Gemset for Gitlab

With Ruby installed and our shell now running the correct version of
Ruby we need to make a gemset to make it easier to manage the gems we
will install for Gitlab. We then set this gemset as the default. After
this is done we need [Bundler](http://gembundler.com) installed to that
gemset.

    rvm gemset create gitlab
    rvm use 1.9.3@gitlab --default

    # Skip Rdoc generation
    echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
    gem install bundler

Install and setup Gitlab!
-------------------------

At last now we are going to clone the Gitlab repository and setup the
application.

    # Clone the Gitlabhq repo from Github
    cd /Users/gitlab
    sudo -u gitlab -H git clone https://github.com/gitlabhq/gitlabhq.git /Users/gitlab/gitlab
    cd /Users/gitlab/gitlab

    # Checkout to 4-2-stable release
    sudo -u gitlab -H git checkout 4-2-stable

We are using branch `4-2-stable` because at the time of writing this is
the branch I have working.

### Configure Gitlab

    cd /Users/gitlab/gitlab

    # Copy the example GitLab config
    sudo -u gitlab -H cp config/gitlab.yml.example config/gitlab.yml

    # Make sure to change "localhost" to the fully-qualified domain name of your host serving GitLab where necessary
    # IMPORTANT: Also update any paths from /home/ to /Users/
    sudo -u gitlab -H vim config/gitlab.yml

    # Make sure GitLab can write to the log/ and tmp/ directories
    sudo chown -R gitlab log/
    sudo chown -R gitlab tmp/
    sudo chmod -R u+rwX  log/
    sudo chmod -R u+rwX  tmp/

    # Make directory for satellites
    sudo -u gitlab -H mkdir /Users/gitlab/gitlab-satellites

    # Copy the example Unicorn config
    sudo -u gitlab -H cp config/unicorn.rb.example config/unicorn.rb

### Configure Gitlab database settings

Since we're using MySQL we want to use the `database.yml` template for
MySQL. Make sure to update username/password in config/database.yml. I
hope you're keeping up!

    cd /Users/gitlab/gitlab
    sudo -u gitlab -H cp config/database.yml.mysql config/database.yml

    # Update config with credentials from earlier when we setup MySQL. You only need to do the production group.
    sudo -u gitlab -H vim config/database.yml

### Install gems

Using Bundler we can install all the gems required by Gitlab, we will be
installing the gems *without* the `development`, `test` and `postgresql`
groups as we won't be needing those.

    # Login as gitlab user
    su - gitlab
    cd ~/gitlab

    # Please note the -- below is not a mistake
    gem install charlock_holmes -- --version '0.6.9' --with-icu-dir=/usr/local/opt/icu4c

    # Configure bundler to always use icu4c from Homebrew and install Gitlab gems
    bundle config build.charlock_holmes --with-icu-dir=/usr/local/opt/icu4c
    bundle install --deployment --without development test postgres

### Configure Git

GitLab needs to be able to commit and push changes to Gitolite. In order
to do that Git requires a username and email. (It's recommended to use
the same address used for the email.from setting in config/gitlab.yml)

    sudo -u gitlab -H git config --global user.name "GitLab"
    sudo -u gitlab -H git config --global user.email "gitlab@localhost"

#### Setup GitLab Hooks

This will setup the custom hooks between Gitlab and Gitolite.

    cd /Users/gitlab/gitlab

    sudo cp ./lib/hooks/post-receive /Users/git/.gitolite/hooks/common/post-receive
    sudo chown git:git /Users/git/.gitolite/hooks/common/post-receive

### Initialise database and activate features

Now it's time to initialise the Gitlab database by running all the
migrations and adding the first admin user. Make a note of the
credentials it gives you at the end so you can login.

    su - gitlab
    cd ~/gitlab

    bundle exec rake gitlab:setup RAILS_ENV=production

    # Precompile the assets into the public directory
    bundle exec rake assets:precompile RAILS_ENV=production

With that done run the following command to output and the environment
info used by Gitlab so you check it all looks right for your machine.

    bundle exec rake gitlab:env:info RAILS_ENV=production

#### Quick test

Let's skip ahead quickly a check out Gitlab! You won't be able to make
any projects as Sidekiq is not running but it shows that all the work
above has achieved something. Use the credentials from above to login.

    # Still as the gitlab user
    su - gitlab
    cd ~/gitlab

    # Start the rails WEBrick server
    RAILS_ENV=production bundle exec rails s

Open `http://127.0.0.1:3000` in your browser. Use ctrl + c to close the
server once you've had a look. It will be quite slow initially as it is
only intended as a development webserver.

Setting up Gitlab with Apache and Unicorn
-----------------------------------------

Since OS X comes with Apache we will use that as our webserver to
Gitlab. You can of course use [Nginx](http://wiki.nginx.org/Main) if you
desire but I will not be going over that option in this guide yet.
Although I hope to go over that option in the future.

### Configure Unicorn

Although not 100% compatible with Apache for [various
reasons](http://rubyforge.org/pipermail/mongrel-unicorn/2011-July/001057.html),
Unicorn will be responsible for processing the Gitlab application. We
need to a make a few alterations to the config to make it "OS X
friendly".

    cd /Users/gitlab/gitlab

    # Update: app_dir to /Users/ instead of /home/
    # Uncomment: listen "127.0.0.1:8080" and change 8080 to 5000
    # Comment: listen "#{app_dir}/tmp/sockets/gitlab.socket" as Apache cannot use sockets
    sudo -u gitlab -H vim config/unicorn.rb

Unicorn needs to startup with the machine but we need to do some work
with RVM. We need to make a wrapper around the `bundle` command so it
can be used at bootup.

    su - gitlab
    rvm wrapper ruby-1.9.3-p392@gitlab bootup bundle

Now we can make a `launchctl` plist file. I've created these plists for
you and saved them as a
(gist)[https://gist.github.com/createdbypete/5345563] so you can grab
that directly:

    sudo curl --output /Library/LaunchDaemons/gitlab.unicorn.plist https://gist.github.com/createdbypete/5345563/raw/gitlab.unicorn.plist

    # Load service with launchctl
    sudo launchctl load /Library/LaunchDaemons/gitlab.unicorn.plist

**Please note:** Unicorn can take a few seconds to start up.

### Configure Sidekiq

We also need Sidekiq to start up with the machine, thankfully the steps
above have shortened some of the work we need to do now and we only need
to create the plist as the `bundle` wrapper is already available. The
plist command used below is an extraction from the [rake
task](https://github.com/gitlabhq/gitlabhq/blob/4-2-stable/lib/tasks/sidekiq.rake)
that should be used but it is not compatible with OS X.

    sudo curl --output /Library/LaunchDaemons/gitlab.sidekiq.plist https://gist.github.com/createdbypete/5345563/raw/gitlab.sidekiq.plist

    # Load service with launchctl
    sudo launchctl load /Library/LaunchDaemons/gitlab.sidekiq.plist

### Configure Apache

In Mountain Lion Apple decided to remove the web sharing option from the
System Preferences panel but Apache is still there so it just means we
need to start it via terminal.

    sudo apachectl start

We need to tell Apache about Gitlab by creating a configuration for it.
Thankfully Apache on OS X loads in all `.conf` files in the
`/etc/apache2/other/` directory so we can create a file in there to
avoid tampering with the main config, this is also easier to manage.

    sudo curl --output /etc/apache2/other/gitlab.conf https://gist.github.com/createdbypete/5345563/raw/gitlab.conf

    # Change ServerName to your machine hostname
    sudo vim /etc/apache2/other/gitlab.conf

    # Restart Apache 
    sudo apachectl restart

**OS X Server People** You can use the Server.app to setup a new
VirtualHost and Allow Overrides. You can then edit the generated
configuration file as required to [match the
gist](https://gist.github.com/createdbypete/5345563#file-gitlab-conf).

Now you can open `http://my-hostname.local` in your browser and you
should be greeted by the Gitlab login screen. Again use the details from
earlier:

    admin@local.host
    5iveL!fe

**Important Note:** This user should be disabled or deleted once you
have got some real users in place with administrator privileges.

**Enjoy!**

If all this is too much for you I recommend checking out the [GitLab
paid service](http://blog.gitlab.com/cloud/). Huge thanks to the [GitLab
Team](https://github.com/gitlabhq?tab=members) and all the contributors.

# This file contains the list of Commands to install necessary softwares and libraries in chronological order
#  to setup the development environment in your local machine.
# -----------------------------------------------------------------


# install git
sudo apt update
sudo apt install git

# Installing Ruby
## Installing RVM to manage Ruby
### Download Public key to verify the shell_script we are going to download to install RVM
curl -#LO https://rvm.io/mpapis.asc
gpg --import mpapis.asc
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Choose the ruby version
rvm install ruby-2.3.1  # only if ruby version you are willing has not been installed

# Choose/use the ruby
rvm use 2.3.1 --default

# Install bundler
gem install bundler

gem install rails

# Install database say PG
sudo apt-get install postgresql postgresql-client
sudo apt-get install libpq-dev

bundle install

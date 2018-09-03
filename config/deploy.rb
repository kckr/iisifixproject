# config valid only for current version of Capistrano
lock '3.7.1'

set :application, 'iisifix'
set :repo_url, 'git@gitlab.com:shivabhusal/iisifix.git'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
# set :rvm1_map_bins, -> { fetch(:rvm_map_bins).to_a.concat(%w{rake gem bundle ruby}).uniq }
set :log_level, :debug
set :use_sudo, true
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/application.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

before 'deploy:check:linked_files', 'upload:yml_files'

# A test line can be deleted

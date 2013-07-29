require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require "rvm/capistrano"

logger.level = Logger::INFO # INFO, DEBUG, TRACE, IMPORTANT
STDOUT.sync
set :green, "\e[32m"
set :red,   "\e[31m"
set :black, "\e[0m"

# ssh
set :application,   'angelguardian'
set :user,          'rails-app'
set :use_sudo,      false

ssh_options[:forward_agent] = true
default_run_options[:pty]   = true

# Environments
set :stages,        %w{angelguardian}
set :default_stage, 'angelguardian'

# Git
set :repository,    'git@github.com:Angelguardianmx/angelguardian-mx.git'
set :branch,        'kinda'
set :scm,           'git'
set :scm_username,  'rails-app'
set :deploy_via,    'remote_cache'
set :deploy_to,     "/home/rails-app/#{application}"

# Parameters, like `bundle exec cap hrbb release -s branch=master`
_cset :branch, 'kinda'
_cset :env, :production

# Ruby
set :rvm_ruby_string,   '1.9.3-p194@angelguardian'
set :rvm_type,          :user
        require './config/boot'
        require 'honeybadger/capistrano'

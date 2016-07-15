# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'snada'
set :repo_url, 'git@github.com:snada/snada.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ENV["SERVER_DEPLOY_FOLDER"]

# Set ruby version
set :rvm_ruby_version, proc { `cat .ruby-version`.chomp }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :nvm_type, :user
set :nvm_node, 'v4.4.7'
set :nvm_map_bins, %w{node npm}

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :bower, "install"
      end
    end
  end

end

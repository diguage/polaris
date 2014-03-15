require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'

set :domain, '198.23.129.153'
set :deploy_to, '/home/deployer/hao.jike.io'
set :repository, 'git@github.com:diguage/polaris.git'
set :branch, 'develop'

set :shared_paths, ['config/database.yml', 'log', 'config/application.yml', 'tmp',  'public/uploads']
set :user, 'deployer'

task :environment do
  invoke :'rvm:use[ruby-2.1.1@polaris]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]

  queue! %[touch "#{deploy_to}/shared/tmp/pids/server.pid"]
  queue  %[echo "-----> Created the 'shared/config/database.yml' file successfully!."]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]

  queue! %[mkdir -p "#{deploy_to}/shared/public/uploads/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/public/uploads/"]

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end

#namespace :unicorn do
#  set :unicorn_pid, "#{app_path}/tmp/pids/unicorn.pid"
#  set :start_unicorn, %{
#    cd #{app_path}
#    bundle exec unicorn -c #{app_path}/config/unicorn.rb -E #{rails_env} -D
#  }
#  set :stop_unicorn, %{
#    test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && echo "Stop Ok" && exit 0
#    echo >&2 "Not running"
#  }
#
#  task :start => :environment do
#    queue! start_unicorn
#  end
#
#  task :stop => :environment do
#    queue! stop_unicorn
#  end
#end
require "bundler/capistrano"

set :application, "CloudTrendz"
set :repository,  "git@github.com:prashant4224/CloudTrendz.git"
set :deploy_to,  "/ebs/apps/#{application}"
set :applicationdir,  "/ebs/apps/#{application}"
set :user, "ubuntu"


set :use_sudo, false
set :scm, :git
set :keep_releases, 2
set :rails_env, "production"
set :precompile_only_if_changed, true


set :deploy_to, applicationdir
set :deploy_via, :export
set :scm_verbose, true


default_run_options[:pty] = true  # Forgo errors when deploying from windows
default_run_options[:shell] = '/bin/bash --login'

ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys

after "deploy:update_code", "deploy:copy_configs"


task :prod do
   set :domain, "52.74.64.64"
   set :repository, "git@github.com:prashant4224/CloudTrendz.git"
   set :local_repository, "git@github.com:prashant4224/CloudTrendz.git"
   set :branch, "master"
   set :scm_verbose, true

   server "52.74.64.64", :app, :web, :db, :primary => true
   set :deploy_env, "prod"

   "deploy"

end

namespace :deploy do

  task :copy_configs, :roles => :app do
    run "cp #{release_path}/../../shared/database.yml #{release_path}/config/database.yml"
    # run "cp #{release_path}/config/initializers/global.rb.#{deploy_env} #{release_path}/config/initializers/global.rb"
    run "cp #{release_path}/config/environment.rb.#{deploy_env} #{release_path}/config/environment.rb"
  end

  task :migrate, :roles => :app do
    run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=production"
  end

  # task :link_shared_directories do
  #   run "ln -s #{shared_path}/uploads #{release_path}/uploads"
  # end

  task :restart, :roles => :app, :except => { :no_release => true } do

    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
    if deploy_env == 'prod'
      tag_name = Time.now.strftime("deploy_%Y_%m_%d_%H_%M")

      system "git tag -a -m 'Deployment on prod' #{tag_name}"

      system "git push origin #{tag_name}"
      if $? != 0
        raise "Pushing tag to origin failed"
      end
    end
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      logger.info "Skipping asset pre-compilation because there were no asset changes"
    end
  end

 
end

after "deploy:update", "deploy:migrate", "deploy:cleanup"
#after "deploy:update_code"
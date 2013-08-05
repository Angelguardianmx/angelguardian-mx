namespace :release do

  desc "Update Git repository"
  task :update_code do
    cmds = []
    cmds << "git fetch"
    cmds << "git reset --hard"
    cmds << "git checkout #{branch}"
    cmds << "git pull origin #{branch}"
    run "cd #{deploy_to} && #{cmds.join(' && ')}"
    puts "#{green} ✓ Update #{branch} branch #{black}"
  end

  desc "Update Bundler gems"
  task :update do
    run "cd #{deploy_to} && bundle check || bundle install --without development test osx heroku"

    puts "#{green} ✓ Verify gems #{black}"
  end

  desc "Clear Rails cache and logs"
  task :cleanup do
    cmds = []
    cmds << "echo > /var/log/rails/#{user}.unicorn.stderr.log"
    cmds << "echo > /var/log/rails/#{user}.unicorn.stdout.log"
    cmds << "echo > /var/log/rails/#{user}/#{env}.log"

    run "cd #{deploy_to} && #{cmds.join(' && ')}"
    run "cd #{deploy_to} && #{rake} RAILS_ENV=#{env} tmp:clear log:clear"

    puts "#{green} ✓ Clean logs #{black}"
  end

  desc "See current migrate status"
  task :migrate do
    run "cd #{deploy_to} && PGPASSWORD='postgres' #{rake} RAILS_ENV=#{env} db:migrate"

    puts "#{green} ✓ Run migrations #{black}"
  end

  desc "Setup the Database"
  task :db_setup do
    run "cd #{deploy_to} && PGPASSWORD='postgres' #{rake} RAILS_ENV=#{env} db:setup"

    puts "#{green} ✓ Run db setup #{black}"
  end


  desc "Solr Reindex"
  task :solr_reindex do
    run "cd #{deploy_to} && #{rake} RAILS_ENV=#{env} sunspot:reindex"

    puts "#{green} ✓ Run db setup #{black}"
  end

  desc "recreate img"
  task :img_recreate do
    run "cd #{deploy_to} && #{rake} RAILS_ENV=#{env} img:recreate"

    puts "#{green} ✓ Run db setup #{black}"
  end

  desc "recreate shor urls"
  task :shor_urls do
    run "cd #{deploy_to} && #{rake} RAILS_ENV=#{env} post:short_urls"

    puts "#{green} ✓ Run db setup #{black}"
  end


  desc "Assets precompile"
  task :precompile do
    run "cd #{deploy_to} && #{rake} RAILS_ENV=#{env} assets:precompile"

    puts "#{green} ✓ Compile assets #{black}"
  end

  desc "Unicorn: Start"
  task :start do
    cmd = "bundle exec unicorn_rails --config-file #{deploy_to}/config/unicorn.rb --env #{env} --daemonize"
    run "source ~/.profile && cd #{deploy_to} && #{cmd}"
  end

  #TODO: do not break if PID file is missing
  desc "Unicorn: Stop"
  task :stop do
    printf "Stop Unicorn ......................................................"

    run "if [ -e /home/rails-app/run/#{application}.unicorn.pid ] ; then kill -s TERM `cat /home/rails-app/run/#{application}.unicorn.pid` ; fi"

    puts "#{green} ✓ #{black}"
  end

  desc "Unicorn: restart"
  task :restart do
    stop
    start
    puts "#{green} ✓ Restart Unicorn"
  end

  desc "Generate Sitemap"
  task :sitemap do
     printf "Generating Sitemap................................................."
     cmd = "RAILS_ENV=#{env} bundle exec rake sitemap:refresh"
     run "cd #{deploy_to} && #{cmd}"
     puts "#{green} ✓ Sitemap Generated #{black}"
  end

  desc "Deploy to QA servers "
  task :default do
    update_code
    update
    #migrate
    precompile
    # sitemap
    cleanup
    restart
  end
end

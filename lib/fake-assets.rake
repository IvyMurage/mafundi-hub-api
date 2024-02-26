namespace :assets do
  desc 'bypass "bundle exec rake assets:precompile" error when deploying to Railway.app'
  task :precompile do
    puts 'bypass "bundle exec rake assets:precompile" error when deploying to Railway.app'
  end
end

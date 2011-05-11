namespace :heroku do
  desc "Example showing PostgreSQL database backups from Heroku to Amazon S3"
  task :backup => :environment do
    HerokuDatabaseBackupToS3.backup
  end
end

desc "Heroku will call this rake task daily"
task :cron => :environment do
  HerokuDatabaseBackupToS3.backup
end
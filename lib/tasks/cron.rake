namespace :heroku do
  desc "Example showing PostgreSQL database backups from Heroku to Amazon S3"
  task :backup => :environment do
    HerokuS3Backup.backup
  end
end

desc "Heroku will call this rake task daily"
task :cron => :environment do
  HerokuS3Backup.backup
end
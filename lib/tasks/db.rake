namespace :db do
  desc "Force drop the database"
  task force_drop: :environment do
    db_name = Rails.configuration.database_configuration[Rails.env]["database"]
    puts "Terminating connections to the database: #{db_name}"
    ActiveRecord::Base.connection.execute(
      <<-SQL
      SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = '#{db_name}'
      AND pid <> pg_backend_pid();
      SQL
    )
    Rake::Task["db:drop"].invoke
  end
end

require 'data_mapper'
require '.app/app.rb'


namespace :db do

  task :auto_upgrade! do
    DataMapper.auto_upgrade!
    puts "Auto upgrade complete (without data loss)"
  end

  task :auto_migrate! do
    DataMapper.auto_migrate!
    puts "Auto migrate complete (with data loss)"
  end
end
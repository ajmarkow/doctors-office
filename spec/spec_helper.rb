require "rspec"
require "pg"
require "doctor"
require "patient"
require "pry"
require "dotenv/load"

DB = PG.connect({ :dbname => "doctors_office_test",  :user => 'postgres',  :password => ENV['pgpass'] })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctor *;")
    DB.exec("DELETE FROM patient *;")
  end
end

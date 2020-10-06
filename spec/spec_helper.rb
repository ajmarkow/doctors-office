require "rspec"
require "pg"
require "doctor"
require "patient"
require "pry"

DB = PG.connect({ :dbname => "record_store_test" })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctor *;")
    DB.exec("DELETE FROM patient *;")
  end
end

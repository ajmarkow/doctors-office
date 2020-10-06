require("pg")
require("dotenv/load")

DB = PG.connect({ :dbname => "doctors_office_test", :user =>'postgres',' :password => ENV['pgpass']})

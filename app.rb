require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
require('pry')
also_reload('lib/**/*.rb')
require("pg")
require("dotenv/load")

DB = PG.connect({ :dbname => "doctors_office", :user =>'postgres', :password => ENV['pgpass']})

get('/') do
  @doctors = Doctor.all  
erb(:main)
end

get('doctors') do
  @doctors = Doctor.all
  erb(:main)
end

  get('patients') do
   patient.all()
    end

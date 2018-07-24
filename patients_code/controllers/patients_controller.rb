require( 'sinatra' )
require( 'sinatra/contrib/all' )
# error is pry-debug is required; cant install it either using gem 'pry-byebug'
# require( 'pry-debug' )
require_relative ( '../models/patient.rb' )
# require_relative ( '../models/disease.rb' )
# require_relative ( '../models/diagnosis.rb' )

#GET: Show all the patients
get '/patients' do
  @patients = Patient.all()
  erb(:"patients/index")
end

#GET: From to create a new patient entry, needs to be above fuzzy routes

get '/patients/new' do
  erb(:"patients/new")
end

post '/patients' do
  patient = Patient.new( params )
  patient.save
end

#GET: Show a specific patient
get '/patients/:id' do
  @patient = Patient.find(params['id'].to_i)
  erb(:"patients/show")
end



#POST: Form to add an new entry to the db

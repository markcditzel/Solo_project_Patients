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

#POST: Patient info to db
post '/patients' do
  @patient = Patient.new( params )
  @patient.save

  erb(:"patients/create")
end

#GET: Show a specific patient
get '/patients/:id' do
  @patient = Patient.find(params['id'].to_i)
  erb(:"patients/show")
end

#POST: Delete a Patient
#NB this is a GET method, if using a find followed by delete method then it is a POST method!
get '/patients/:id/delete' do
  @deleted_patient = Patient.find(params['id'])
  @patient = Patient.delete( params['id'] )
  erb(:"patients/delete")
  # redirect to "patients"
end

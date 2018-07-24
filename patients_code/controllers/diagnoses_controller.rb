require( 'sinatra' )
require( 'sinatra/contrib/all' )
# error is pry-debug is required; cant install it either using gem 'pry-byebug'
# require( 'pry-debug' )
require_relative ( '../models/diagnosis.rb' )
require_relative ( '../models/disease.rb' )
require_relative ( '../models/diagnosis.rb' )


#GET: Show all the patients
get '/diagnoses' do
  @diagnoses = Diagnosis.all()
  erb(:"diagnoses/index")
end

# GET Create a new diagnosis

get '/diagnoses/new' do
  @patients = Patient.all
  @diseases = Disease.all
  erb(:"diagnoses/new")
end

#POST Send new diagnosis to db
post '/diagnoses' do
  diagnosis = Diagnosis.new( params )
  diagnosis.save
  redirect to("/patients")
end

#GET: Show a specific patient
get '/diagnoses/:id' do
  @diagnosis = Diagnosis.find(params['id'].to_i)
  erb(:"diagnoses/show")
end

#
# #POST: Patient info to db
# post '/patients' do
#   @patient = Patient.new( params )
#   @patient.save
#
#   erb(:"patients/create")
# end

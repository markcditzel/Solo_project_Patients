require( 'sinatra' )
require( 'sinatra/contrib/all' )
# error is pry-debug is required; cant install it either using gem 'pry-byebug'
# require( 'pry-debug' )
require_relative ( '../models/diagnosis.rb' )
# require_relative ( '../models/disease.rb' )
# require_relative ( '../models/diagnosis.rb' )

#GET: Show all the patients
get '/diagnoses' do
  @diagnoses = Diagnosis.all()
  erb(:"diagnoses/index")
end

#GET: Show a specific patient
get '/diagnoses/:id' do
  @diagnosis = Diagnosis.find(params['id'].to_i)
  erb(:"diagnoses/show")
end

# Create a new diagnosis

get '/diagnoses/new' do
  @patients = Patient.all
  @diseases = Disease.all
  erb(:"diagnoses/new")
end

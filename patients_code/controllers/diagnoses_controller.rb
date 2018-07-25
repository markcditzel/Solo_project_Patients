require( 'sinatra' )
require( 'sinatra/contrib/all' )
# error is pry-debug is required; cant install it either using gem 'pry-byebug'
# require( 'pry-debug' )
require_relative ( '../models/diagnosis.rb' )
require_relative ( '../models/disease.rb' )
require_relative ( '../models/diagnosis.rb' )


#INDEX = GET: Show all the patients
get '/diagnoses' do
  @diagnoses = Diagnosis.all()
  erb(:"diagnoses/index")
end

#NEW = GET Create a new diagnosis form
get '/diagnoses/new' do
  @patients = Patient.all
  @diseases = Disease.all
  erb(:"diagnoses/new")
end

#CREATE = POST Send new diagnosis to db
post '/diagnoses' do
  diagnosis = Diagnosis.new( params )
  diagnosis.save
  redirect to("/patients")
end

#EDIT = GET a prepopulated form to edit details
get '/diagnoses/:id/edit' do
  @diagnosis = Diagnosis.find(params['id'])
  erb( :"diagnoses/edit" )
end

#UPDATE = POST the updated infor to the db

post '/diagnoses/:id' do
  diagnosis = Diagnosis.new( params )
  diagnosis.update
  redirect to "patients"  
end


#SHOW = GET: Show a specific patient
get '/diagnoses/:id' do
  @diagnosis = Diagnosis.find( params['id'].to_i)
  erb(:"diagnoses/show")
end

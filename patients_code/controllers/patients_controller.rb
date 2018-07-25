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

#Alternative DELETE a patient for show
post '/patients/:id/delete' do
  @patient = Patient.find( params['id'])
  @patient.delete
  redirect to "patients"
end

#EDIT
get '/patients/:id/edit' do
  @genders = ['Male','Female']
  @patient = Patient.find( params['id'] )
  erb(:"patients/edit")
end

#UPDATE
post '/patients/:id' do
  patient = Patient.new(params)
  patient.update
  redirect to "/patients/#{params['id']}"
end



# This method worked when entered directly into bar
# POST: Delete a Patient
# get '/patients/:id/delete' do
#   @deleted_patient = Patient.find(params['id'])
#   @patient = Patient.delete( params['id'] )
#   erb(:"patients/delete")
#   # redirect to "patients"
# end

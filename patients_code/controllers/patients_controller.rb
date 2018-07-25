require( 'sinatra' )
require( 'sinatra/contrib/all' )
# error is pry-debug is required; cant install it either using gem 'pry-byebug'
# require( 'pry-debug' )
require_relative ( '../models/patient.rb' )
# require_relative ( '../models/disease.rb' )
# require_relative ( '../models/diagnosis.rb' )

#INDEX = #GET: Show all the patients
get '/patients' do
  @patients = Patient.all()
  erb(:"patients/index")
end

#NEW = GET: From to create a new patient entry, needs to be above fuzzy routes
get '/patients/new' do
  erb(:"patients/new")
end

#CREATE = POST: Patient info to db
post '/patients' do
  @patient = Patient.new( params )
  @patient.save

  erb(:"patients/create")
end

#SHOW = GET: Show a specific patient
get '/patients/:id' do
  @patient = Patient.find(params['id'].to_i)
  erb(:"patients/show")
end

#DELETE Alternative DELETE a patient for show
post '/patients/:id/delete' do
  @patient = Patient.find( params['id'])
  @patient.delete
  redirect to "patients"
end

#EDIT GET
get '/patients/:id/edit' do
  @genders = ['Male','Female']
  @patient = Patient.find( params['id'] )
  erb(:"patients/edit")
end

#UPDATE POST
post '/patients/:id' do
  patient = Patient.new( params )
  patient.update
  redirect to "/patients/#{params['id']}"
end

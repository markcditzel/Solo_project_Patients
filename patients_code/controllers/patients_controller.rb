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

#GET: Show a specific patient

#GET: From to create a new patient entry

#POST: Form to add an new entry to the db

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ( '../models/disease.rb' )

#GET: Show all the patients
get '/diseases' do
  @diseases = Disease.all()
  erb(:"diseases/index")
end

#GET: Show a specific patient
get '/diseases/:id' do
  @disease = Disease.find(params['id'].to_i)
  erb(:"diseases/show")
end

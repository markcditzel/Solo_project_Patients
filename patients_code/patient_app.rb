require ( 'sinatra' )
require ( 'sinatra/contrib/all' )

#will reload models after any changes
also_reload('./models/*')

require_relative( 'controllers/diagnoses_controller.rb')
require_relative( 'controllers/diseases_controller.rb')
require_relative( 'controllers/patients_controller.rb')

get '/' do
  erb( :index)
end

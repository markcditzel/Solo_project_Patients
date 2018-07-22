# require( 'sinatra' )
# require( 'sinatra/contrib/all' )
# require( 'pry-debug' )
require_relative ( '../models/patient.rb' )
require_relative ( '../models/disease.rb' )
require_relative ( '../models/diagnosis.rb' )


patient2 = Patient.new({
  "first_name" => "Mark",
  "second_name" => "Ditzel",
  "dob" => "4-8-1974",
  "age" => "41",
  "gender" => "male",
  "profession" => "binman"})

patient2.save

require( 'pry-byebug' )
require_relative( './models/patient' )
require_relative( './models/disease' )
require_relative( './models/diagnosis' )

#Patient.delete_all()
# Disease.delete_all()
# Diagnosis.delete_all()


# patient1 = Patient.new({
#   "first_name" => "Mark",
#   "second_name" => "Ditzel",
#   "dob" => "4-8-1974",
#   "age" => "41",
#   "gender" => "male",
#   "profession" => "binman"})
#
# patient1.save()

p Patient.find('4')

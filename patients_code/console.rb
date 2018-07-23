require( 'pry-byebug' )
require_relative( './models/patient' )
require_relative( './models/disease' )
require_relative( './models/diagnosis' )

Patient.delete_all()
# Disease.delete_all()
# Diagnosis.delete_all()


patient1 = Patient.new({
  "first_name" => "Mark",
  "second_name" => "Ditzel",
  "dob" => "4-8-1974",
  "age" => "41",
  "gender" => "male",
  "profession" => "binman"})

patient1.save()

# patient1.second_name = 'Dizdell'
# patient1.update

#p Patient.find('4')

# p Patient.all()

#Patient.delete(6)

disease1 = Disease.new({
"common_name" => "croop",
"latin_name" => "acute laryngotracheitis",
"disease_agent_class" => "virus",
"organs_affected" => "lungs",
"severity_index" => "3"
})

disease1.save

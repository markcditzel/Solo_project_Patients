require_relative ('../models/patient.rb')
require_relative ('../models/disease.rb')
require_relative ('../models/diagnosis.rb')

require ('pry-byebug')

Diagnosis.delete_all
Patient.delete_all
Disease.delete_all

#First make patients

patient1 = Patient.new({
  "first_name" => "Robert",
  "second_name" => "Walpole",
  "dob" => "26-08-1676",
  "age" => "10",
  "gender" => "male",
  "profession" => "plumber"
  })
patient1.save

patient2 = Patient.new({
  "first_name" => "Earl",
  "second_name" => "Wilmington",
  "dob" => "01-01-1673",
  "age" => "20",
  "gender" => "male",
  "profession" => "astronaut"
  })
patient2.save

patient3 = Patient.new({
  "first_name" => "Henry",
  "second_name" => "Pelham",
  "dob" => "25-09-1694",
  "age" => "30",
  "gender" => "male",
  "profession" => "cook"
  })
patient3.save

patient4 = Patient.new({
  "first_name" => "Duke",
  "second_name" => "Newcastle",
  "dob" => "21-07-1693",
  "age" => "30",
  "gender" => "male",
  "profession" => "astronaut"
  })
patient4.save

patient5 = Patient.new({
  "first_name" => "Margaret",
  "second_name" => "Thatcher",
  "dob" => "13-10-1925",
  "age" => "40",
  "gender" => "female",
  "profession" => "milk snatcher"
  })
patient5.save

patient6 = Patient.new({
  "first_name" => "Theresa",
  "second_name" => "May",
  "dob" => "01-09-1956",
  "age" => "50",
  "gender" => "female",
  "profession" => "clown"
  })
patient6.save

#Second make diseases

disease1 = Disease.new({
  "common_name" => "Flu",
  "latin_name" => "Influenza",
  "disease_agent_class" => "virus",
  "organs_affected" => "lungs, eyes, muscles",
  "severity_index" => "4"
  })

disease1.save()

disease2 = Disease.new({
  "common_name" => "Cold",
  "latin_name" => "acute viral nasopharyngitis",
  "disease_agent_class" => "virus",
  "organs_affected" => "sinus, nose",
  "severity_index" => "1"
  })

disease2.save()

disease3 = Disease.new({
  "common_name" => "crabs",
  "latin_name" => "pubic lice",
  "disease_agent_class" => "insecta",
  "organs_affected" => "pubic hair",
  "severity_index" => "1"
  })

disease3.save

disease4 = Disease.new({
"common_name" => "croop",
"latin_name" => "acute laryngotracheitis",
"disease_agent_class" => "virus",
"organs_affected" => "lungs",
"severity_index" => "3"
})

disease4.save

disease5 = Disease.new({
"common_name" => "eczma",
"latin_name" => "atopic dermatitis",
"disease_agent_class" => "autoimmune",
"organs_affected" => "skin, eyes",
"severity_index" => "4"
})

disease5.save

disease6 = Disease.new({
"id" => "1",
"common_name" => "dropsy",
"latin_name" => "acute gutach",
"disease_agent_class" => "virus",
"organs_affected" => "guts",
"severity_index" => "3"
})

disease6.save

#Third construct diagnoses by linking patient to a disease


diagnosis1 = Diagnosis.new({
  "disease_id" => patient1.id,
  "patient_id" => disease1.id,
  "date_of_diagnosis" => "01-01-2018",
  "severity_score" => "10",
  "disease_active" => "true",
  "date_of_resolution" => nil
  })
diagnosis1.save

# diagnosis2 = Diagnosis.new({
#   "disease_id" => patient2.id,
#   "patient_id" => disease2.id,
#   "date_of_diagnosis" => "01-01-2018",
#   "severity_score" => "10",
#   "disease_active" => "false",
#   "date_of_resolution" => "11-11-2018"
#   })
#
# diagnosis2.save
#
# diagnosis3 = Diagnosis.new({
#   "disease_id" => patient3.id,
#   "patient_id" => disease3.id,
#   "date_of_diagnosis" => "01-01-2018",
#   "severity_score" => "10",
#   "disease_active" => "false",
#   "date_of_resolution" => "01-02-2018"
#   })
# diagnosis3.save
#
# diagnosis4 = Diagnosis.new({
#   "disease_id" => patient4.id,
#   "patient_id" => disease4.id,
#   "date_of_diagnosis" => "01-01-2018",
#   "severity_score" => "10",
#   "disease_active" => "false",
#   "date_of_resolution" => "01-02-2018"
#   })
# diagnosis4.save
#
# diagnosis5 = Diagnosis.new({
#   "disease_id" => patient1.id,
#   "patient_id" => disease2.id,
#   "date_of_diagnosis" => "01-01-2018",
#   "severity_score" => "10",
#   "disease_active" => "true",
#   "date_of_resolution" => ""
#   })
# diagnosis5.save

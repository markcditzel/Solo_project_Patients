require_relative ('../models/patient.rb')
require_relative ('../models/disease.rb')
require_relative ('../models/diagnosis.rb')

require ('pry-byebug')

Diagnosis.delete_all
Patient.delete_all
Disease.delete_all

#First make patients

#Second make diseases

#Third construct diagnoses by linking patient to a disease

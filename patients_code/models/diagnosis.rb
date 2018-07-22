require 'date'

class Diagnosis

  attr_reader :disease_id, :patient_id, :date_of_diagnosis, :severity_score, :date_of_resolution

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @disease_id = options["disease_id"].to_i if options["disease_id"]
    @patient_id = options["patient_id"].to_i if options["patient_id"]
    @date_of_diagnosis = Date.parse(options["date_of_diagnosis"])
    @severity_score = options["severity_score"].to_i
    @disease_active = if  options["disease_active"] == 'true'
        true
      elsif
        options["disease_active"] == 'true'
        false
      end
    @date_of_resolution = Date.parse(options["date_of_resolution"])
    end

end

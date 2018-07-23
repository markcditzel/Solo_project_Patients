require 'date'

class Diagnosis

  attr_reader :disease_id, :patient_id, :date_of_diagnosis, :severity_score, :disease_active, :date_of_resolution

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @disease_id = options["disease_id"].to_i if options["disease_id"]
    @patient_id = options["patient_id"].to_i if options["patient_id"]
    @date_of_diagnosis = Date.parse(options["date_of_diagnosis"])
    @severity_score = options["severity_score"].to_i
    @disease_active = if options["disease_active"] == 'true'
         true
      elsif
        options["disease_active"] == 'true'
         false
      end
    @date_of_resolution = Date.parse(options["date_of_resolution"])
    end

    #Define CRUD-associated methods - this order avoids a clash between unintended routing into a 'fuzzy' :id containing action

    #C = GET:new and POST:create
    #R = GET:index and GET:show
    #U = GET:edit and POST:update
    #D = POST:destroy

  def save()
    sql = 'INSERT INTO diagnoses
    ( disease_id,
    patient_id,
    date_of_diagnosis,
    severity_score,
    disease_active,
    date_of_resolution
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING id'
    values = [@disease_id, @patient_id, @date_of_diagnosis, @severity_score, @disease_active, @date_of_resolution]
    diagnosis = SqlRunner.run( sql, values ).first
    @id = diagnosis['id'].to_i
  end

  def assign_disease
    #take a patient_id and assign it to a Diagnosis
  end

  def assign_patient
    #take a patient and assign it to a Diagnosis
  end

end

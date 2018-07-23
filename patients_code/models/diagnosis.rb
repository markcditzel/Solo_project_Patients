require 'date'

class Diagnosis

  attr_reader :disease_id, :patient_id, :date_of_diagnosis, :severity_score, :disease_active, :date_of_resolution

  attr_writer :disease_active, :date

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @disease_id = options["disease_id"].to_i if options["disease_id"]
    @patient_id = options["patient_id"].to_i if options["patient_id"]
    @date_of_diagnosis = Date.parse(options["date_of_diagnosis"])
    @severity_score = options["severity_score"].to_i
    @disease_active = if options["disease_active"] == 'true'
      true
    elsif
      options["disease_active"] == 'false'
      false
    end
    #TODO need to add somethign to accept nil, empty or n/a
    @date_of_resolution =  Date.parse(options["date_of_resolution"])
  end


  # Cant get the date_of_resolution to accept a empty string and display 'not resolved' or 'n/a' if no resolution date is provided

  # options["date_of_diagnosis"] == "n/a"
  #   return "n/a"
  # else

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

  def self.delete_all
    sql = 'DELETE FROM diagnoses'
    SqlRunner.run( sql )
  end

  def self.all()
    sql = 'SELECT * FROM diagnoses'
    results = SqlRunner.run( sql )
    return results.map { |diagnosis| Diagnosis.new( diagnosis )}
  end

  def update()
    sql = 'UPDATE diagnoses
    SET
    (
      disease_active,
      date_of_resolution
    )
    =
    (
      $1, $2
    )
    WHERE id = $3'
    values = [@disease_active, @date_of_resolution, @id]
    SqlRunner.run( sql, values )
  end


  def assign_disease
    #take a patient_id and assign it to a Diagnosis
  end

  def assign_patient
    #take a patient and assign it to a Diagnosis
  end

end

require 'date'
require 'pry-byebug'
class Diagnosis

  attr_reader :id, :disease_id, :patient_id, :date_of_diagnosis, :severity_score, :disease_active, :date_of_resolution

  attr_writer :disease_active, :date_of_resolution

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @disease_id = options["disease_id"].to_i if options["disease_id"]
    @patient_id = options["patient_id"].to_i if options["patient_id"]
    @date_of_diagnosis = Date.parse(options["date_of_diagnosis"])
    @severity_score = options["severity_score"].to_i
    @disease_active = (options["disease_active"] == 't') ? true : false
    #Pawel said the database would return t or f; and we changed the Sql field to Boolean

    # binding.pry

    #TODO need to add somethign to accept nil, empty or n/a
    @date_of_resolution =
    if options["disease_active"] == 'false'
       Date.parse(options["date_of_resolution"])
    else
       options["date_of_resolution"] = nil
    end
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

  def self.delete_all
    sql = 'DELETE FROM diagnoses'
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = 'DELETE FROM diagnoses
    WHERE id = $1'
    values = [id]
    SqlRunner.run( sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM diagnoses'
    results = SqlRunner.run( sql )
    return results.map { |diagnosis| Diagnosis.new( diagnosis )}
  end

  def self.find( id )
    sql = 'SELECT * FROM diagnoses
    WHERE id = $1'
    values = [id]
    results = SqlRunner.run( sql, values )
    return Diagnosis.new( results.first)
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

  def assign_disease()
    sql = 'SELECT * FROM diseases
    WHERE id = $1'
    values = [@disease_id]
    disease = SqlRunner.run( sql, values )
    return Disease.new( disease.first )
  end

  def assign_patient()
    sql = 'SELECT * FROM patients
    WHERE id = $1'
    values = [@patient_id]
    patient = SqlRunner.run( sql, values )
    return Patient.new( patient.first)
  end

end

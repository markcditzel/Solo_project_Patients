require_relative( '../db/sql_runner' )

require 'date' # this ensures that dobs and ages can be manipulated

class Patient

  attr_reader :id, :first_name, :second_name, :dob, :age, :gender, :profession
  #these values are for the .update functon; dob should not change
  attr_writer :first_name, :second_name, :dob, :age, :gender, :profession

  #this method is passed options which will be provided as a hash; the ['x'] references the key of the hash

  #CREATE
  def initialize( options )
    #this pulls the id-associated 'value' and converts it from a string to an integer; the if statement ensure that the to_i method is only called if there is a string-number to act upon; therefore preventing a nil.to_i error
    #the id is provided once the database assigns it a primary key
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"].capitalize
    @second_name = options["second_name"].capitalize

    #this method creates the dob by calling Date class method by passing in the options['dob']; NB the format has to be 2008, 4, 10 (Year, Month, Year)
    #May have to enter dob as seperate day, month and year instance variables and the dob formed by joining by commas

    # for .new ensure the format is 2000,2,3
    # for .parse the format can be 31-12-2010'
    # NB need to add require 'date' to allow date manipulations
    # @dob1 = Date.new( options['dob'] ).to_i
    @dob = Date.parse( options["dob"])

    #NB To get the days difference:
    # (newer_date -older_date).to_i

    # need to take into account leap years etc!

    #To get the difference
    #dob - current_date = results in seconds
    #Convert seconds to days by / by 86400


    #the age can be entered as direct input or calculated from the difference between current date and provided dob.

    #   def age(dob)
    # now = Time.now.utc.to_date
    # now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)


    #     def age_at(date, dob)
    #   day_diff = date.day - dob.day
    #   month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
    #   date.year - dob.year - (month_diff < 0 ? 1 : 0)
    # end

    #     def age(dob)
    #   now = Time.now.utc.to_date
    #   now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    # end

    #for now - just enter an integer!
    @age = options["age"].to_i
    @gender = options["gender"].capitalize
    @profession = options["profession"].capitalize
  end

  #CREATE 2/2
  def save()
    sql = 'INSERT INTO patients
    ( first_name,
      second_name,
      dob,
      age,
      gender,
      profession
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id'
    values = [@first_name, @second_name, @dob, @age, @gender, @profession]
    patient = SqlRunner.run( sql, values ).first
    @id = patient['id'].to_i
  end

  #Show all
  def self.all()
    sql = 'SELECT * FROM patients'
    results = SqlRunner.run(sql)
    return results.map { |patient| Patient.new( patient )}
  end

  #delete all
  def self.delete_all
    sql = 'DELETE FROM patients'
    SqlRunner.run( sql )
  end

  #show specific item
  def self.find( id )
    sql = 'SELECT * FROM patients
    WHERE id = $1'
    values = [id]
    results = SqlRunner.run( sql, values )
    return Patient.new( results.first)
  end

  #delete CLASS specific
  def self.delete( id )
    sql = 'DELETE FROM patients
    WHERE id = $1'
    values = [id]
    SqlRunner.run( sql, values )
  end

  #delete an object
  def delete()
    sql = 'DELETE FROM patients
    WHERE id = $1'
    values = [@id]
    SqlRunner.run( sql, values )
  end

  #UPDATE - matched these to those available in the EDIT.ERB
  def update()
    sql = 'UPDATE patients
    SET
    (
      first_name,
      second_name,
      dob,
      age,
      gender,
      profession
    )
    =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7'
    values = [@first_name, @second_name, @dob, @age, @gender, @profession, @id]
    SqlRunner.run( sql,values )
  end

  #method to identify which disease the patient is associated with
  #acts via the diagnosis table
  def diseases()
    sql = 'SELECT diseases.*
    FROM diseases
    INNER JOIN diagnoses
    ON diagnoses.disease_id = diseases.id
    WHERE patient_id = $1;'
    values = [@id]
    diseases = SqlRunner.run( sql, values )
    result = diseases.map { |disease| Disease.new (disease)}
    return result
  end

  def diagnoses_active()
    sql = 'SELECT diagnoses.*
    FROM diagnoses
    INNER JOIN patients
    ON patients.id = diagnoses.patient_id
    WHERE disease_active = true;'
    diagnoses = SqlRunner.run( sql )
    result = diagnoses.map {|diagnosis| Diagosis.new(diagnosis)}
    return result
  end



  def current_age(id)
    patient = Patient.find(id)
    date = Date.today
    patient_dob = patient.dob
    return (date - patient_dob).to_i/365
  end

  def total_disease(id)
    patient = Patient.find(id)
    patient_sev_index = patient
  end

end

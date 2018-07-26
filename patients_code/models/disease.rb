class Disease

  attr_reader :id, :common_name, :latin_name, :disease_agent_class, :organs_affected, :severity_index

  attr_writer :id, :common_name, :latin_name, :disease_agent_class, :organs_affected, :severity_index

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @common_name = options["common_name"].capitalize
    @latin_name = options["latin_name"].capitalize
    @disease_agent_class = options["disease_agent_class"].capitalize
    # we want to create an array to hold multiple organs, so convert string with .split to create an array
    # need to work out how to remove commas
    @organs_affected = options["organs_affected"].capitalize
    # .split.map(&:capitalize)]

    #.split.map(|organ| organ.capitalize))

    @severity_index = options["severity_index"].to_i
  end

  def save
    sql = 'INSERT INTO diseases
    ( common_name,
    latin_name,
    disease_agent_class,
    organs_affected,
    severity_index
    )
    VALUES (
    $1, $2, $3, $4, $5
    )
    RETURNING id'
    values = [@common_name, @latin_name, @disease_agent_class, @organs_affected, @severity_index]
    disease = SqlRunner.run( sql, values ).first
    @id = disease['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM diseases'
    results = SqlRunner.run(sql)
    return results.map { |disease| Disease.new( disease)}
  end

  def self.delete_all
    sql = 'DELETE FROM diseases'
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = 'SELECT * FROM diseases
    WHERE id = $1'
    values = [id]
    results = SqlRunner.run( sql, values )
    return Disease.new(results.first)
  end

  def self.delete( id )
    sql = 'DELETE FROM diseases WHERE id = $1'
    values = [id]
    SqlRunner.run( sql, values )
  end

  # retrive the patients that have been diagnosed with thr disease of interest
  # Acts via the diagnoses table
  def patients()
    sql = 'SELECT patients.*
    FROM patients
    INNER JOIN diagnoses
    ON diagnoses.patient_id = patients.id
    WHERE disease_id = $1;'
    values = [@id]
    patients = SqlRunner.run( sql, values )
    result = patients.map { |patient| Patient.new (patient)}
    return result
  end



end

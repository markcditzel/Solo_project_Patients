class Disease

  attr_reader :common_name, :latin_name, :disease_agent_class, :organs_affected, :severity_index

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

  

end

class Disease

  attr_reader

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @common_name = options["common_name"].capitalize
    @latin_name = options["latin_name"].capitalize
    @disease_route = options["disease_route"].capitalize
    # we want to create an array to hold multiple organs, so convert string with .split to create an array
    #NB - need to work out how to remove commas
    @organs_affected = options["organs_affected"].split.map(|organ| organ.capitilize)
    @severity_index = options["severity_index"].to_i
  end

end

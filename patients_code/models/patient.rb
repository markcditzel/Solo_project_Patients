# require_relative( '../db/sql_runner' )

require 'date' # this ensures that dobs and ages can be manipulated

class Patient

  attr_reader :first_name, :second_name, :dob, :age, :gender, :profession

  #this method is passed options which will be provided as a hash; the ['x'] references the key of the hash
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


end

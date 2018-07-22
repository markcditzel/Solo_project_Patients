require('minitest/autorun')
require 'date'
require_relative('../models/patient')

class TestPatient < MiniTest::Test

  def setup
    #NB - alternative way to enter info for new patient instanstiation
    morag_hash = {
      "first_name" => "Morag",
      "second_name" => "Martin",
      "dob" => "16-3-1976",
      "age" => "31",
      "gender" => "female",
      "profession" => "scientist"}

    @patient1 = Patient.new(morag_hash)

    @patient2 = Patient.new({
      "first_name" => "Mark",
      "second_name" => "Ditzel",
      "dob" => "4-8-1974",
      "age" => "41",
      "gender" => "male",
      "profession" => "binman"})

      @patient3 = Patient.new({
        "first_name" => "david",
        "second_name" => "lewis",
        "dob" => "11-11-1999",
        "age" => "20",
        "gender" => "male",
        "profession" => "astronaut"
      })
  end

  def test_patient_first_name
    assert_equal("Mark", @patient2.first_name)
  end

  def test_patient_first_name_capitilize
    assert_equal("David", @patient3.first_name)
  end

  def test_patient_second_name
    assert_equal("Ditzel", @patient2.second_name)
  end

  def test_patient_second_name_capitilize
    assert_equal("Lewis", @patient3.second_name)
  end

  # This format is defined by the arguments given to strftime %a = day_of_week_name; %d = date_number; %b = month_name; %Y = year_number
  def test_dob_parse_function
    assert_equal("11-Nov-1999", @patient3.dob.strftime('%d-%b-%Y'))
  end

  def test_age_converts_to_integer_FAIL
    assert_equal("20", @patient3.age)
  end

  def test_age_converts_to_integer_PASS
    assert_equal(20, @patient3.age)
  end

  def test_gender_capitilsation_FAIL
    assert_equal("male", @patient3.gender)
  end

  def test_gender_capitisation_PASS
    assert_equal("Male", @patient3.gender)
  end

  def test_gender_type_FAIL
    assert_equal("Female", @patient3.gender)
  end

  def test_profession_capitilization_PASS
    assert_equal("Astronaut", @patient3.profession)
  end

end

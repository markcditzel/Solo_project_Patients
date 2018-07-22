require('minitest/autorun')
require_relative('patient')

class PatientTest < MiniTest::Test

  def test_create_patient_object
    morag_hash = {
      "first_name" => "Morag",
      "second_name" => "Martin",
      "dob" => "16-3-1976",
      "age" => "31",
      "gender" => "female",
      "profession" => "scientist"}

    patient1 = Patient.new(morag_hash)

    p patient1

  end
end

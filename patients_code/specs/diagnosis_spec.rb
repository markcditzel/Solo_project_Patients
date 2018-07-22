require('minitest/autorun')
require 'date'
require_relative('../models/diagnosis')
require_relative('../models/disease')
require_relative('../models/patient')

class TestDiagnosis < MiniTest::Test

  def setup

    @diseaseX = Disease.new({
    "id" => "1",
    "common_name" => "dropsy",
    "latin_name" => "acute gutsache",
    "disease_agent_class" => "virus",
    "organs_affected" => "guts",
    "severity_index" => "3"
    })

    @patientX = Patient.new({
      "id" => "1",
      "first_name" => "Mike",
      "second_name" => "Biggs",
      "dob" => "11-11-1999",
      "age" => "100",
      "gender" => "male",
      "profession" => "killer"
    })

    @diagnosisX = Diagnosis.new({
      "disease_id" => "1",
      "patient_id" => "1",
      "date_of_diagnosis" => "01-01-2018",
      "severity_score" => "10",
      "disease_active" => "true",
      "date_of_resolution" => "21-01-2018"
      })


  end

  def test_diagnosis_disease_id_PASS
    assert_equal(1, @diagnosisX.disease_id)
  end

  def test_patient_id_PASS
    assert_equal(1, @diagnosisX.patient_id)
  end

  def test_date_of_diagnosis_PASS
    assert_equal("01-Jan-2018", @diagnosisX.date_of_diagnosis.strftime('%d-%b-%Y'))
  end

  def test_severity_score_PASS
    assert_equal(10, @diagnosisX.severity_score)
  end

  def test_disease_active_PASS
    assert_equal(true, @diagnosisX.disease_active)
  end

  def test_disease_active_FAIL
    assert_equal(false, @diagnosisX.disease_active)
  end


  def test_date_of_resolution_PASS
    assert_equal("21-Jan-2018", @diagnosisX.date_of_resolution.strftime('%d-%b-%Y'))
  end
end

require('minitest/autorun')
require_relative('../models/disease')
# require 'pry'

class TestDisease < MiniTest::Test

  def setup

    @disease1 = Disease.new({
      "common_name" => "crabs",
      "latin_name" => "pubic lice",
      "disease_agent_class" => "insecta",
      "organs_affected" => "pubic hair",
      "severity_index" => "1"
      })

    @disease2 = Disease.new({
    "common_name" => "croop",
    "latin_name" => "acute laryngotracheitis",
    "disease_agent_class" => "virus",
    "organs_affected" => "lungs",
    "severity_index" => "3"
    })

    @disease3 = Disease.new({
    "common_name" => "eczma",
    "latin_name" => "atopic dermatitis",
    "disease_agent_class" => "autoimmune",
    "organs_affected" => "skin, eyes",
    "severity_index" => "4"
    })

  end

  def test_disease_common_name_PASS
    assert_equal("Eczma", @disease3.common_name)
  end

  def test_latin_name_PASS
    assert_equal("Acute laryngotracheitis", @disease2.latin_name)
  end

  def test_disease_agent_class_PASS
    assert_equal("Autoimmune", @disease3.disease_agent_class)
  end

  def test_organs_affected_single_organ_PASS
    assert_equal("Pubic hair", @disease1.organs_affected)
  end

  def test_organs_affected_multi_organ_PASS
    assert_equal("Skin, eyes", @disease3.organs_affected)
  end


  def test_severity_index_PASS
    assert_equal(4, @disease3.severity_index)
  end


end
# binding.pry
#
#



#   def test_disease_has_common_name_PASS
#     assert_equal('Crabs', @disease1.common_name)
#   end
# end

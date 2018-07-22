require('minitest/autorun')
require 'date'
require_relative('../models/disease')

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
    "organs_affected" => "skin",
    "severity_index" => "3"
    })
    # @patient4 = Disease.new({
    #   "" => "sarcoidosis",
    #   "latin_name" => "v",
    #   "disease_agent_class" => "autoimmune",
    #   "organs_affected" => "lungs lymph-glands skin eyes liver",
    #   "severity_index" => "3"
    # })

    p @disease1

  end

  def test_disease_has_common_name_PASS
    assert_equal('Crabs', @disease1.common_name)
  end
end

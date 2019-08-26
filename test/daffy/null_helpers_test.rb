# frozen_string_literal: true

require "test_helper"

class NullObject
  include Daffy::NullHelpers
end

class NullHelpersTest < Minitest::Test
  def setup
    @obj = NullObject.new
  end

  def test_that_object_is_nil
    assert @obj.nil?
  end

  def test_that_object_is_not_present
    refute @obj.present?
  end

  def test_that_object_is_blank
    assert @obj.blank?
  end
end

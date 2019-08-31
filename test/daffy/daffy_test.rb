# frozen_string_literal: true

require "test_helper"

class DaffyTest < Minitest::Test
  def setup
    User.create!(
      first_name:     "Bob",
      last_name:      "Loblaw",
      enrolled_on:    Date.yesterday,
      login_attempts: 12,
      email:          "bobloblaw@bobloblawslawblog.com",
      level:          9,
    )

    Guest.create!(email: "guest@example.com")

    @real_user  = User.find_by(last_name: "Loblaw")
    @fake_user  = User.find_by(last_name: "Nope!")
    @real_guest = Guest.find_by(email: "guest@example.com")
    @fake_guest = Guest.new
  end

  def test_nil
    refute @real_user.nil?
    assert @fake_user.nil?
  end

  def test_that_object_is_not_present
    assert @real_user.present?
    refute @fake_user.present?
  end

  def test_that_object_is_blank
    refute @real_user.blank?
    assert @fake_user.blank?
  end

  def test_that_name_is_blank_string
    assert @real_user.first_name == "Bob"
    assert @fake_user.first_name == ""
  end

  def test_that_level_uses_default
    assert @real_user.level == 9
    assert @fake_user.level == 1
  end

  def test_that_login_attempts_uses_daffy_default
    assert @real_user.login_attempts == 12
    assert @fake_user.login_attempts == 0
  end

  def test_that_enrolled_on_uses_today
    assert @real_user.enrolled_on == Date.yesterday
    assert @fake_user.enrolled_on == Date.today
  end

  def test_that_guest_uses_quacked_value
    assert @real_guest.email == "guest@example.com"
    assert @fake_guest.email == "no-reply@guest.com"
  end
end

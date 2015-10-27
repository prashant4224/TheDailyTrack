require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "profile_email" do
    mail = UserMailer.profile_email
    assert_equal "Profile email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

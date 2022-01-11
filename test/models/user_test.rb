require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'must have first name' do
    user = User.new
    assert_raises(ActiveRecord::RecordInvalid) do
      user.save!
    end
  end

  test 'saves if everything is right' do
    user = User.new
    user.first_name = "Ted"
    user.last_name  = "Williams"
    assert_difference 'User.count', 1 do
      user.save!
    end
  end
end

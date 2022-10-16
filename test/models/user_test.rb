# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
  end

  test '#following?, #followed_by?, #follow and #unfollow' do
    assert_not @user1.following?(@user2)
    assert_not @user2.followed_by?(@user1)
    @user1.follow(@user2)
    assert @user1.following?(@user2)
    assert @user2.followed_by?(@user1)
    @user1.unfollow(@user2)
    assert_not @user1.following?(@user2)
    assert_not @user2.followed_by?(@user1)
  end

  test '#name_or_email' do
    assert_equal '1@example.com', @user1.name_or_email
    @user1.name = 'one'
    assert_equal 'one', @user1.name_or_email
  end
end

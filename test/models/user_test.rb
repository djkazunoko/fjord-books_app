# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
  end

  test '#following?' do
    assert_not @user1.following?(@user2)
    @user1.follow(@user2)
    assert @user1.following?(@user2)
  end

  test '#followed_by?' do
    assert_not @user1.followed_by?(@user2)
    @user2.follow(@user1)
    assert @user1.followed_by?(@user2)
  end

  test '#follow' do
    assert_not @user1.following?(@user2)
    @user1.follow(@user2)
    assert @user1.following?(@user2)
  end

  test '#unfollow' do
    @user1.follow(@user2)
    assert @user1.following?(@user2)
    @user1.unfollow(@user2)
    assert_not @user1.following?(@user2)
  end

  test '#name_or_email' do
    assert_equal '1@example.com', @user1.name_or_email
    @user1.name = 'one'
    assert_equal 'one', @user1.name_or_email
  end
end

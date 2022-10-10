# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @report = reports(:one)
  end

  test '#editable?' do
    assert @report.editable?(@user1)
    assert_not @report.editable?(@user2)
  end

  test '#created_on' do
    assert_equal '2022/10/09', I18n.l(@report.created_on)
  end
end

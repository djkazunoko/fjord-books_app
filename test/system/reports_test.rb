# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: '1@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'report1'
    fill_in '内容', with: 'This is report1'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'report1'
    assert_text 'This is report1'
  end

  test 'updating a Report' do
    visit reports_url
    page.find('td > a', text: '編集').click

    assert_selector 'h1', text: '日報の編集'
    assert_text 'report1'
    assert_text 'This is report1'

    fill_in 'タイトル', with: '日報のタイトル'
    fill_in '内容', with: '日報の内容'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '日報のタイトル'
    assert_text '日報の内容'
  end

  test 'destroying a Report' do
    visit reports_url
    count = Report.count
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_equal Report.count, (count - 1)
  end
end

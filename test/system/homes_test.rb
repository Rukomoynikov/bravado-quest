require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  driven_by :selenium, using: :chrome

  setup do
    visit root_url
  end

  test 'view all profiles' do
    assert_selector '.userCard', count: 4
  end

  test 'view filtered profiles' do
    search_input = find('.searchForm__input')
    search_input.fill_in with: 'Wat'

    assert_selector '.userCard', count: 3
  end

  test 'view empty results' do
    search_input = find('.searchForm__input')
    search_input.fill_in with: 'AllaAlla'

    assert_selector '.userCard', count: 0
  end

  test 'search query added in url and saves between reloads' do
    search_input = find('.searchForm__input')
    search_input.fill_in with: 'Wat'
    assert_selector '.userCard', count: 3

    refresh

    assert_selector '.userCard', count: 3
    assert current_url.include?('/search/Wat')
  end
end

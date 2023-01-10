require 'application_system_test_case'

class DayTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @workout = workouts(:one)
    @day = days(:one)

    visit workout_path(@workout)
  end

  test 'Creating a new day' do
    assert_selector 'h1', text: 'First workout'

    click_on 'Add Day'
    assert_selector 'h1', text: 'First workout'
    fill_in 'day_title', with: 'Day 2'

    click_on 'submit_day_title'
    assert_text 'Day 2'
  end

  test 'Updating a day' do
    assert_selector 'h1', text: 'First workout'

    within id: dom_id(@day) do
      click_on 'edit_day'
    end

    assert_selector 'h1', text: 'First workout'

    fill_in 'day_title', with: 'Day 3'
    click_on 'submit_day_title'

    assert_text 'Day 3'
  end

  test 'Destroying a day' do
    assert_text 'Day 1'

    accept_confirm do
      within id: dom_id(@day) do
        click_on 'delete_day'
      end
    end

    assert_no_text 'Day 1'
  end
end

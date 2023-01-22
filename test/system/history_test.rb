require 'application_system_test_case'
require 'test_helper'

class HistoryTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @workout = workouts(:one)
    @day = days(:one)
    @exercise = exercises(:one)
    @exercise_set = exercise_sets(:one)

    visit workout_day_path(@workout, @day)
  end

  test 'Creating a new history' do
    assert_selector 'h1', text: 'Day 1'

    within "##{dom_id(@exercise)}" do
      click_on 'Add Set', match: :first
    end

    assert_selector 'h1', text: 'Day 1'
    fill_in 'set_number', with: '2'
    fill_in 'weight', with: '60kg'
    fill_in 'reps_dist', with: '12'

    click_on 'submit_exercise_set'
    assert_text '2'
    assert_text '60kg'
    assert_text '12'
  end

  test 'Updating a set' do
    assert_selector 'h1', text: 'Day 1'

    within id: dom_id(@exercise_set) do
      click_on 'edit_set'
    end

    assert_selector 'h1', text: 'Day 1'

    fill_in 'set_number', with: '3'
    fill_in 'weight', with: '65kg'
    fill_in 'reps_dist', with: '8'
    click_on 'submit_exercise_set'

    assert_text '3'
    assert_text '65kg'
    assert_text '8'
  end

  test 'Destroying a set' do
    within id: dom_id(@exercise) do
      assert_text '1'
      assert_text '50kg'
      assert_text '10'
    end

    accept_confirm do
      within id: dom_id(@exercise) do
        click_on 'delete'
      end
    end

    within id: dom_id(@exercise) do
      assert_no_text '1'
      assert_no_text '50kg'
      assert_no_text '10'
    end
  end
end

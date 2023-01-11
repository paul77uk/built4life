require 'application_system_test_case'
require 'test_helper'

class ExerciseTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @workout = workouts(:one)
    @day = days(:one)
    @exercise = exercises(:one)

    visit workout_day_path(@workout, @day)
  end

  test 'Creating a new exercise' do
    assert_selector 'h1', text: 'Day 1'

    click_on 'Add Exercise'
    assert_selector 'h1', text: 'Day 1'
    fill_in 'exercise_title', with: 'Squat'

    click_on 'submit_exercise_title'
    assert_text 'Squat'
  end

  test 'Updating an exercise' do
    assert_selector 'h1', text: 'Day 1'

    within id: dom_id(@exercise) do
      click_on 'edit_exercise'
    end

    assert_selector 'h1', text: 'Day 1'

    fill_in 'exercise_title', with: 'Bench'
    click_on 'submit_exercise_title'

    assert_text 'Bench'
  end

  test 'Destroying an exercise' do
    assert_text 'Clean & Press'

    accept_confirm do
      within id: dom_id(@exercise) do
        click_on 'delete_exercise'
      end
    end

    assert_no_text 'Clean & Press'
  end
end

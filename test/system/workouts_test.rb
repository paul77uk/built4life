require 'application_system_test_case'
require 'test_helper'

class WorkoutsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @workout = workouts(:one)
  end

  test 'visiting the index if signed out' do
    sign_out users(:one)
    visit workouts_path
    assert_selector 'h1', text: 'Welcome back'
    assert_text 'Sign in'
  end

  test 'visiting the index if signed in' do
    visit workouts_path
    assert_selector 'h1', text: 'Workouts'
  end

  test 'showing a workout' do
    visit workouts_path
    click_link @workout.name

    assert_selector 'h1', text: @workout.name
  end

  test 'should create workout' do
    visit workouts_path

    click_on 'New workout'
    fill_in 'Name', with: 'Second workout'
    click_on 'submit'

    assert_selector 'h1', text: 'Workouts'
    assert_text 'Second workout'
  end

  test 'should update Workout' do
    visit workouts_path
    assert_selector 'h1', text: 'Workouts'

    click_on 'Edit', match: :one

    fill_in 'Name', with: 'Updated Workouts'
    click_on 'submit'

    assert_text 'Updated Workout'
  end

  test 'should destroy Workout' do
    visit workouts_path

    assert_text 'First workout'

    click_on 'destroy_workout', match: :one
    page.driver.browser.switch_to.alert.accept
    assert_no_text 'First workout'
  end
end

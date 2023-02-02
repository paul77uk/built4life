class AddWorkouts < ActiveRecord::Migration[7.0]
  def change
    User.all.each do |user|
      # a new wo for each user
      wo = Workout.create(user_id: user.id, name: 'B4L Workout 1')
      # the workout for this user of the loop
      # 3 days

      day1 = Day.create(workout_id: wo.id, title: 'Day 1')
      day2 = Day.create(workout_id: wo.id, title: 'Day 2')
      day3 = Day.create(workout_id: wo.id, title: 'Day 3')

      # day 1
      cp_wu = Exercise.create(day_id: day1.id, title: 'Clean & Press - Warm up')

      (1..3).each do |set_number|
        ExerciseSet.create(exercise_id: cp_wu.id, set_number:, reps_dist: '5')
      end

      cp_emom = Exercise.create(day_id: day1.id, title: 'Clean & Press - EMOM')

      (1..15).each do |set_number|
        ExerciseSet.create(exercise_id: cp_emom.id, set_number:)
      end

      sc = Exercise.create(day_id: day1.id, title: 'Shoulder Carry')

      (1..3).each do |set_number|
        ExerciseSet.create(exercise_id: sc.id, set_number:)
      end

      fw = Exercise.create(day_id: day1.id, title: 'Farmers Walk')

      (1..3).each do |set_number|
        ExerciseSet.create(exercise_id: fw.id, set_number:)
      end

      pu = Exercise.create(day_id: day1.id, title: 'Push ups')

      (1..3).each do |set_number|
        ExerciseSet.create(exercise_id: pu.id, set_number:)
      end

      dips = Exercise.create(day_id: day1.id, title: 'Dips')

      (1..3).each do |set_number|
        ExerciseSet.create(exercise_id: dips.id, set_number:)
      end

      bbuto = Exercise.create(day_id: day1.id, title: 'Bulgarian Bag Upright to Overhead - EMOM')

      (1..10).each do |set_number|
        ExerciseSet.create(exercise_id: bbuto.id, set_number:)
      end

      # day 2
      Exercise.create(day_id: day2.id, title: 'Squat - Warm up')
      Exercise.create(day_id: day2.id, title: 'Squat - EMOM')
      Exercise.create(day_id: day2.id, title: 'Lunge')

      # day 3
      Exercise.create(day_id: day3.id, title: 'Sprints')
    end
  end
end

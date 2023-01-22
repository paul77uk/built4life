class AddWorkouts < ActiveRecord::Migration[7.0]
  def change
    User.all.each do |user|
      Workout.create(user_id: user.id, name: 'B4L Workout 1')
    end
  end
end

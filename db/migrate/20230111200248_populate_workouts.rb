class PopulateWorkouts < ActiveRecord::Migration[7.0]
  def change
    User.all.each do |user|
      Workout.create(user_id: user.id, name: 'Workout 3')
    end
  end
end

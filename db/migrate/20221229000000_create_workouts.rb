class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true, type: :int

      t.timestamps
    end
  end
end

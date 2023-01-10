class CreateExerciseSets < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_sets do |t|
      t.references :exercise, null: false, foreign_key: true, type: :int
      t.string :set_number
      t.string :weight
      t.string :reps_dist
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

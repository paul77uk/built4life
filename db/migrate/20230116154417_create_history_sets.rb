class CreateHistorySets < ActiveRecord::Migration[7.0]
  def change
    create_table :history_sets do |t|
      t.references :history_exercise, null: false, foreign_key: true
      t.string :exercise_set
      t.string :weight
      t.string :reps_dist

      t.timestamps
    end
  end
end

class CreateHistoryExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :history_exercises do |t|
      t.references :history_day, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end

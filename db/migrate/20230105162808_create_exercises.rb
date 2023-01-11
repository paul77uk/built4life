class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.references :day, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end

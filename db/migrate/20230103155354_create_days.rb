class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.references :workout, null: false, foreign_key: true, type: :int
      t.string :title, null: false

      t.timestamps
    end
  end
end

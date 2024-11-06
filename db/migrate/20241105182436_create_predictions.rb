class CreatePredictions < ActiveRecord::Migration[8.0]
  def change
    create_table :predictions do |t|
      t.belongs_to :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

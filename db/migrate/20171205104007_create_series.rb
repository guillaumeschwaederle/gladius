class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.integer :goal
      t.integer :done
      t.references :exercice, foreign_key: true
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end

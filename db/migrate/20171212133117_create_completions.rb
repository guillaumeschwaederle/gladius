class CreateCompletions < ActiveRecord::Migration[5.1]
  def change
    create_table :completions do |t|
      t.integer :done
      t.references :serie, foreign_key: true
      t.references :seance, foreign_key: true

      t.timestamps
    end
  end
end

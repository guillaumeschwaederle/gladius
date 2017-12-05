class CreateExercices < ActiveRecord::Migration[5.1]
  def change
    create_table :exercices do |t|
      t.string :name

      t.timestamps
    end
  end
end

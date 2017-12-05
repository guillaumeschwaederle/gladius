class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end

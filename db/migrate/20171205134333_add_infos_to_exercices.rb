class AddInfosToExercices < ActiveRecord::Migration[5.1]
  def change
    add_column :exercices, :category, :string
    add_column :exercices, :description, :text
  end
end

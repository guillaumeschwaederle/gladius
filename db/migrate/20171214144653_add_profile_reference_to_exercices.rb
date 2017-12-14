class AddProfileReferenceToExercices < ActiveRecord::Migration[5.1]
  def change
    add_reference :exercices, :profile, foreign_key: true
  end
end

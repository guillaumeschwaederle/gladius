class AddVilleToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :ville, :string
  end
end

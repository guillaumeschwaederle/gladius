class AddSpecialitetoProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :specialite, :string
  end
end

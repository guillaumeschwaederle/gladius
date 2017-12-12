class RemoveDoneFromSeries < ActiveRecord::Migration[5.1]
  def change
    remove_column :series, :done, :integer
  end
end

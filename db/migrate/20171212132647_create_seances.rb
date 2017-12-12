class CreateSeances < ActiveRecord::Migration[5.1]
  def change
    create_table :seances do |t|
      t.datetime :date
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end

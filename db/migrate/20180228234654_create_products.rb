class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end

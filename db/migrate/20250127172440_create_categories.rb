class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false 

      t.timestamps
    end

    change_table :cars do |t|
      t.references :category, foreign_key: true, null: true
    end
  end
end

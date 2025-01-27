class CreateCarsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :cars_categories do |t|
      t.references :car, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateObstacles < ActiveRecord::Migration[6.0]
  def change
    create_table :obstacles do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.boolean :availability, default: true
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

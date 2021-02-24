class AddColumnToObstacles < ActiveRecord::Migration[6.0]
  def change
    add_column :obstacles, :description, :text
  end
end

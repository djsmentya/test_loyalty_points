class CreatePointLineItems < ActiveRecord::Migration
  def change
    create_table :point_line_items do |t|
      t.string :user_id
      t.integer :points
      t.string :source

      t.timestamps
    end
  end
end

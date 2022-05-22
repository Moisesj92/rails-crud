class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.boolean :visible

      t.timestamps
    end
  end
end

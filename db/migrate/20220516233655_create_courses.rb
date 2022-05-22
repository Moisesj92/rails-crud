class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.boolean :published, default: false

      t.timestamps #created_at && updated_at
    end
  end
end

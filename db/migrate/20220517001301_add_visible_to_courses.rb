class AddVisibleToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :visible, :boolean
  end
end

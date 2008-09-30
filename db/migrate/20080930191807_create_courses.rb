class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses, :force => true do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end

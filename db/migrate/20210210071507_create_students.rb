class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :roll_no
      t.integer :class_no
      t.string :school

      t.timestamps
    end
  end
end

class AddTrayectoryFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :academic_grade, :integer, default: 0
    add_column :users, :academic_institution, :string
    add_column :users, :academic_program, :string
    add_column :users, :academic_description, :string

    add_column :users, :work_type, :integer, default: 0
    add_column :users, :work_place, :string
    add_column :users, :work_position, :string
    add_column :users, :work_description, :string

  end
end

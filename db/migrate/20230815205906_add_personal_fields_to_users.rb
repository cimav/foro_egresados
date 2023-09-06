class AddPersonalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :curp, :string
    add_column :users, :first_name, :string
    add_column :users, :first_surname, :string
    add_column :users, :second_surname, :string
    add_column :users, :telephone, :string
    add_column :users, :address, :string
    add_column :users, :linkedin, :string
    add_column :users, :notes, :text

    add_column :users, :sni, :numeric, default: 0

    add_index :users, :curp, unique: true
  end
end

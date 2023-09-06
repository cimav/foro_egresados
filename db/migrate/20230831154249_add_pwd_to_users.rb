class AddPwdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pwd_tmp, :string
  end
end

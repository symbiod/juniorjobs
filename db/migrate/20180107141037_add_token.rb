class AddToken < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :token, :string, null: false    
  end
end

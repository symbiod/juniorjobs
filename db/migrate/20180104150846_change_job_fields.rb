class ChangeJobFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :tasks, :string
    remove_column :jobs, :condition, :string

    add_column :jobs, :company_name, :string
    add_column :jobs, :company_email, :string
    add_column :jobs, :company_contact, :string
    add_column :jobs, :company_page, :string
    add_column :jobs, :company_phone, :string
    add_column :jobs, :expired_at, :datetime, null: false
  end
end

class ChangeJobFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :tasks, :string
    remove_column :jobs, :condition, :string
    remove_column :jobs, :status, :boolean
    remove_column :jobs, :employment_type, :string

    add_column :jobs, :company_name, :string, null: false
    add_column :jobs, :company_email, :string, null: false
    add_column :jobs, :company_contact, :string
    add_column :jobs, :company_page, :string
    add_column :jobs, :company_phone, :string

    add_column :jobs, :expired_at, :datetime, null: false
    add_column :jobs, :language, :string
    add_column :jobs, :specialization, :string
    add_column :jobs, :employment, :string
  end
end

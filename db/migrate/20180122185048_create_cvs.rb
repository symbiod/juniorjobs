class CreateCvs < ActiveRecord::Migration[5.1]
  def change
    create_table :cvs do |t|
      t.boolean  :status
      t.string   :title, null: false
      t.string   :employment
      t.string   :name, null: false
      t.text     :description, null: false
      t.string   :country
      t.string   :city
      t.boolean  :remote
      t.string   :currency
      t.integer  :salary_from
      t.integer  :salary_to
      t.boolean  :salary_by_agreement
      t.text     :education
      t.text     :skills
      t.text     :work_experience
      t.datetime :expired_at, null: false

      t.string :address
      t.string :phone, null: false
      t.string :email, null: false
      t.string :web_site

      t.references :user, index: true

      t.timestamps
    end
  end
end

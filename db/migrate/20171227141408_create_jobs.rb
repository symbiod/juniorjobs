class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.boolean :status
      t.string   :title
      t.text     :description
      t.string   :employment_type
      t.string   :country
      t.string   :city
      t.boolean :remote
      t.string   :currency
      t.integer  :salary_from
      t.integer  :salary_to
      t.boolean :salary_by_agreement
      t.text     :tasks
      t.text     :requirements
      t.text     :condition
      t.references :user, index: true
      t.timestamps
    end
  end
end

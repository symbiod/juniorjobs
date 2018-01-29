# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.boolean :status
      t.string   :title, null: false
      t.text     :description, null: false
      t.string   :employment_type, null: false
      t.string   :country
      t.string   :city
      t.boolean :remote
      t.string   :currency
      t.integer  :salary_from
      t.integer  :salary_to
      t.boolean :salary_by_agreement
      t.text     :tasks, null: false
      t.text     :requirements, null: false
      t.text     :condition, null: false
      t.references :user, index: true
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class AddStatusToJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :status, :boolean
    add_column :jobs, :status, :string
  end
end

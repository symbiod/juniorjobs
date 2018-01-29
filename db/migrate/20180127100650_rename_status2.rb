# frozen_string_literal: true

class RenameStatus2 < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :status, :string, default: :not_approved
  end
end

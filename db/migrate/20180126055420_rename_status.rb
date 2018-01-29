# frozen_string_literal: true

class RenameStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :status, :string, default: :unapproved
  end
end

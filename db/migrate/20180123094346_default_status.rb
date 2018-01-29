# frozen_string_literal: true

class DefaultStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :status, :string, default: :unaprooved
  end
end

class SubscriptionActive < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :active, :boolean, default: true, null: false    
  end
end

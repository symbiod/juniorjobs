class SubscriptionEmailNullFalse < ActiveRecord::Migration[5.1]
  def change
    change_column :subscriptions, :email, :string, null: false
  end
end

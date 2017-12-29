class AddIndexToSubscriptionOnUser < ActiveRecord::Migration[5.1]
  def change
    add_index(:subscriptions, :user_id)
  end
end

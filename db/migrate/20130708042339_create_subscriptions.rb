class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email, :null => false
      t.boolean :is_subscribed, :null => false, :default => true
      t.timestamps
    end
  end
end

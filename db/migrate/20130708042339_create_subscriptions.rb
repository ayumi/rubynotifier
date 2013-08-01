class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string  :email, null: false, unique: true
      t.string  :confirm_token, null: false, default: ""
      t.string  :cancel_token, null: false, default: ""
      t.boolean :is_subscribed, null: false, default: false
      t.string  :last_version_string, null: false, default: ""
      t.timestamps
    end
  end
end

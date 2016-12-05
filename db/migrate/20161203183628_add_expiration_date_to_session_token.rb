class AddExpirationDateToSessionToken < ActiveRecord::Migration
  def change
    add_column :session_tokens, :expires_at, :datetime
  end
end

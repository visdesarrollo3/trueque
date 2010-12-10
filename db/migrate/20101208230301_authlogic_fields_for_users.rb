class AuthlogicFieldsForUsers < ActiveRecord::Migration
  def self.up
    %w(login email crypted_password password_salt persistence_token perishable_token current_login_ip last_login_ip single_access_token).each do |field|
      add_column :users, field.to_sym, :string
    end

    %w(login_count failed_login_count).each do |field|
      add_column :users, field.to_sym, :integer
    end

    %w(last_request_at current_login_at last_login_at).each do |field|
      add_column :users, field.to_sym, :datetime
    end
    
  end

  def self.down
    %w(login email crypted_password password_salt persistence_token perishable_token current_login_ip last_login_ip single_access_token).each do |field|
      remove_column :users, field.to_sym
    end

    %w(login_count failed_login_count).each do |field|
      remove_column :users, field.to_sym
    end

    %w(last_request_at current_login_at last_login_at).each do |field|
      remove_column :users, field.to_sym
    end
  end
end
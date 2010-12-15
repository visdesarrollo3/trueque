class RefactorTradesTable < ActiveRecord::Migration
  def self.up
    remove_column :trades, :accepted
    add_column :trades, :current_state, :string
  end

  def self.down
    remove_column :trades, :current_state
    add_column :trades, :accepted, :boolean
  end
end

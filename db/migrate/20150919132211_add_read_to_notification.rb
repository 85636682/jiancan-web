class AddReadToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :read, :boolean
  end
end

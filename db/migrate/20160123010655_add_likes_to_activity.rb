class AddLikesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :likes, :integer
  end
end

class AddLoginAndPasswordToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :login, :string
    add_column :workers, :password, :string
  end
end

class RenamePasswordToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :workers, :password, :password_digest
  end
end

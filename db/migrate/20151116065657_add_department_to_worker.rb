class AddDepartmentToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :department, :string
  end
end

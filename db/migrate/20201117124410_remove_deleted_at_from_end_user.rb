class RemoveDeletedAtFromEndUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :deleted_at, :datetime
  end
end

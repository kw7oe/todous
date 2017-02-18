class AddDoneAtToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :done_at, :datetime
  end
end

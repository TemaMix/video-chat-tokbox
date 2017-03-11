class ChangeColumnSessionId < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :session_id, :string, null: false
  end
end

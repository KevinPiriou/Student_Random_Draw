class User < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :speech, :boolean
  end
end

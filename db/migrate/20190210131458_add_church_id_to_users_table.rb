class AddChurchIdToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :church, index: true
  end
end

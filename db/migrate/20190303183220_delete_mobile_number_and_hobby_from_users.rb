class DeleteMobileNumberAndHobbyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hobby 
    remove_column :users, :mobile_number
  end
end

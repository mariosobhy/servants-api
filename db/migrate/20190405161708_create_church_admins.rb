class CreateChurchAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :church_admins do |t|
      t.references :church, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

class AddChurchAdminIdToAminOsra < ActiveRecord::Migration[5.2]
  def change
    add_reference :amin_osras, :church_admin, index: true
  end
end

class AddChurchAssociationToOsra < ActiveRecord::Migration[5.2]
  def change
    add_reference :osras, :church, index: true
  end
end

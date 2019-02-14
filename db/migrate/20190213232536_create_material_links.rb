class CreateMaterialLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :material_links do |t|
      t.string :label
      t.string :url
      t.references :lecture, index: true

      t.timestamps
    end
  end
end

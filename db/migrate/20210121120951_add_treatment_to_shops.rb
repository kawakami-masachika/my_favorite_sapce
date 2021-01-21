class AddTreatmentToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :treatment, :integer, null: false, comment: "取り扱い"
  end
end

class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string :taste, null: false

      t.timestamps
    end
  end
end

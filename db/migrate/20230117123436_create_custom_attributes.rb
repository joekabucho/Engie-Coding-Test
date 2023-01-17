class CreateCustomAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_attributes do |t|
      t.string :model_type
      t.integer :model_id
      t.string :attribute_name
      t.string :attribute_value
      t.belongs_to :model_attribute, null: false, foreign_key: true

      t.timestamps
    end
    add_index :custom_attributes, [:model_type, :model_id], unique: true
  end
end

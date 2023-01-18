class CreateCustomAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_attributes do |t|
      t.string :model_type
      t.integer :model_id
      t.string :attribute_name
      t.string :attribute_value
      
      t.timestamps
    end
    add_index :custom_attributes, [:model_type, :model_id], unique: true
  end
end

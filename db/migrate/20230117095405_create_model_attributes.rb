class CreateModelAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :model_attributes do |t|
      t.string :model_type
      t.string :attribute_name
      
      t.timestamps
    end
    add_index :model_attributes, [:model_type, :attribute_name], unique: true
  end
end

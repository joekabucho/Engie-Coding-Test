class CreateCustomAttributesView < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE VIEW custom_attributes_view AS
      SELECT custom_attributes.*, model.type as model_type
      FROM custom_attributes
      JOIN model ON custom_attributes.model_id = model.id AND custom_attributes.model_type= model.type
    SQL
  end

  def down
    execute "DROP VIEW custom_attributes_view"
  end
end

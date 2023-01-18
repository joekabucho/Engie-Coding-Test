require 'rails_helper'
require  './db/migrate/20230117095405_create_model_attributes.rb'


RSpec.describe ::CreateModelAttributes, type: :migration do
  it 'creates the model_attributes table' do
    expect { subject.change }.to change { ActiveRecord::Base.connection.table_exists?(:model_attributes) }.from(false).to(true)
  end

  it 'adds the model_type and attribute_name columns' do
    subject.change
    expect(ActiveRecord::Base.connection.column_exists?(:model_attributes, :model_type)).to be true
    expect(ActiveRecord::Base.connection.column_exists?(:model_attributes, :attribute_name)).to be true
  end

  it 'adds the unique index on model_type and attribute_name' do
    subject.change
    index_exists = ActiveRecord::Base.connection.index_exists?(:model_attributes, [:model_type, :attribute_name], unique: true)
    expect(index_exists).to be true
  end
end

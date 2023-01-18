require 'rails_helper'
require  './db/migrate/20230117123436_create_custom_attributes.rb'

describe CreateCustomAttributes do
  describe '#change' do
    it 'creates the custom_attributes table' do
      expect(ActiveRecord::Base.connection.table_exists?(:custom_attributes)).to be false
      subject.change
      expect(ActiveRecord::Base.connection.table_exists?(:custom_attributes)).to be true
    end
    it 'has the correct columns' do
      subject.change
      expect(ActiveRecord::Base.connection.columns(:custom_attributes).map(&:name)).to match_array(["id", "model_type", "model_id", "attribute_name", "attribute_value", "created_at", "updated_at"])
    end
    it 'has the correct indexes' do
      subject.change
      expect(ActiveRecord::Base.connection.indexes(:custom_attributes).map{|i| i.name}).to match_array(["index_custom_attributes_on_model_type_and_model_id"])
    end
    it 'has unique indexes' do
      subject.change
      expect(ActiveRecord::Base.connection.index_exists?(:custom_attributes, [:model_type, :model_id], unique: true)).to be true
    end
  end
end

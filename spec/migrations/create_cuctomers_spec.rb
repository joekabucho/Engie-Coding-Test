require 'rails_helper'
require  './db/migrate/20230117101813_create_customers.rb'

describe CreateCustomers do
  describe '#change' do
    it 'creates the customers table' do
      expect(ActiveRecord::Base.connection.table_exists?(:customers)).to be false
      subject.change
      expect(ActiveRecord::Base.connection.table_exists?(:customers)).to be true
    end
    it 'has the correct columns' do
      subject.change
      expect(ActiveRecord::Base.connection.columns(:customers).map(&:name)).to match_array(["id", "name", "phone_number", "created_at", "updated_at"])
    end
  end
end


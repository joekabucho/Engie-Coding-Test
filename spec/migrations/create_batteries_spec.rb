require 'rails_helper'
require  './db/migrate/20230117101920_create_batteries.rb'

describe CreateBatteries do
  describe '#change' do
    it 'creates the batteries table' do
      expect(ActiveRecord::Base.connection.table_exists?(:batteries)).to be false
      subject.change
      expect(ActiveRecord::Base.connection.table_exists?(:batteries)).to be true
    end
    it 'has the correct columns' do
      subject.change
      expect(ActiveRecord::Base.connection.columns(:batteries).map(&:name)).to match_array(["id", "capacity", "created_at", "updated_at"])
    end
  end
end
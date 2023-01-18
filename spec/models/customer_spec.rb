require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#set_custom_attribute' do
    it 'sets a custom attribute for a customer' do
      customer = Customer.create(name: "John")
      customer.set_custom_attribute("email", "example@email.com")
      expect(customer.custom_attributes.find_by(attribute_name: "email").attribute_value).to eq("example@email.com")
    end

    it 'raises an error when attribute value is blank' do
      customer = Customer.create(name: "John")
      expect{ customer.set_custom_attribute("email", "") }.to raise_error(ArgumentError, "attribute value cannot be blank")
    end
  end

  describe '#get_custom_attribute' do
    it 'gets a custom attribute value for a customer' do
      customer = Customer.create(name: "John")
      battery.set_custom_attribute("brand", "chloride exide")
      expect(battery.get_custom_attribute("brand")).to eq "chloride exide"
    end
  end
end
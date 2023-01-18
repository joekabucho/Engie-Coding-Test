require 'rails_helper'
require  './app/concerns/customizable.rb'

RSpec.describe Customizable, type: :model do
  include Customizable

  describe '#set_custom_attribute' do
    let(:customer) { Customer.create(name: 'John Doe', phone_number: '555-555-5555') }

    it 'sets a custom attribute for the model' do
      customer.set_custom_attribute('email', 'johndoe@example.com')
      expect(customer.get_custom_attribute('email')).to eq('johndoe@example.com')
    end

    it 'raises an error if the attribute value is blank' do
      expect { customer.set_custom_attribute('email', '') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the attribute is not allowed for the model' do
      expect { customer.set_custom_attribute('random_attr', 'some value') }.to raise_error(ArgumentError)
    end
  end

  describe '#get_custom_attribute' do
    let(:customer) { Customer.create(name: 'Jane Smith', phone_number: '555-555-5555') }

    it 'retrieves a custom attribute for the model' do
      customer.set_custom_attribute('email', 'janesmith@example.com')
      expect(customer.get_custom_attribute('email')).to eq('janesmith@example.com')
    end

    it 'raises an error if the attribute is not allowed for the model' do
      expect { customer.get_custom_attribute('random_attr') }.to raise_error(ArgumentError)
    end
  end

end

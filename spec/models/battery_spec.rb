require 'rails_helper'

RSpec.describe Battery, type: :model do
  describe "#create" do
    context "with valid params" do
      it "creates a new battery and sets custom attribute" do
        battery_params = { name: "Battery 1", capacity: 100 }
        battery = Battery.new(battery_params)
        battery.set_custom_attribute("brand", "chloride exide")
        expect(battery.save).to be true
        expect(battery.get_custom_attribute("brand")).to eq "chloride exide"
      end
    end
  
    context "with invalid params" do
      it "does not create a new battery" do
        battery_params = { name: nil, capacity: 100 }
        battery = Battery.new(battery_params)
        expect(battery.save).to be false
      end
    end
  end
  
  describe "#get_custom_attribute" do
    it "retrieves the value of the specified custom attribute" do
      battery = create(:battery)
      battery.set_custom_attribute("brand", "chloride exide")
      expect(battery.get_custom_attribute("brand")).to eq "chloride exide"
    end
  end
end
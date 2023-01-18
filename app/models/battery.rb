require  './app/models/concerns/custom_attributes.rb'

class Battery < ApplicationRecord
    include Customizable

    def create
        @battery = Battery.new(battery_params)
        @battery.set_custom_attribute("battery", "chloride exide")
        if @battery.save
          redirect_to @battery, notice: 'Battery was successfully created.'
        else
          render :new
        end
    end
      

    def get_email
        @battery = Battery.find(params[:id])
        @model = @battery.get_custom_attribute("battery")
    end
end

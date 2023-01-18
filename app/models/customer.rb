require  './app/concerns/custom_attributes.rb'

class Customer < ApplicationRecord
    include Customizable


    def create
        @customer = Customer.new(customer_params)
        @customer.set_custom_attribute("email", "example@email.com")
        if @customer.save
          redirect_to @customer, notice: 'Customer was successfully created.'
        else
          render :new
        end
    end
      

    def get_email
        @customer = Customer.find(params[:id])
        @email = @customer.get_custom_attribute("email")
    end
      

    # customer = Customer.new
    # customer.set_custom_attribute("email", "example@email.com")
    # customer.get_custom_attribute("email") # returns "example@email.com"

end

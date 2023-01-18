require  './app/concerns/customizable.rb'

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
      


end

***Engie coding assignment***

***Pseudocode/steps*** 

1. My solution is to creating separate table called "custom_attributes" with the following columns:
* model_name (string)
* model_id (integer)
* attribute_name (string)
* attribute_value (string)
2. I  then created a Concern called "CustomAttributes" that can be included in any model. This concern would provide methods for the model to interact with the custom_attributes table. For example, the concern would provide methods to set and get custom attributes for a specific instance of the model.
3. To handle the configuration of which attributes are allowed for each model, I then created a table called "model_attributes" with the following columns:
*  model_name (string)
*  attribute_name (string)
4. When a new attribute is added for a specific model, a new row is then inserted into the model_attributes table with the appropriate model_name and attribute_name. The concern  then check's this table before allowing an attribute to be set or retrieved for a specific model.
5. For querying the custom attributes using pure SQL, I  created a view that joins the custom_attributes table with the model's table on the model_id and model_name columns. This view  allows for querying the custom attributes in the same way as querying the model's attributes.
6. I then add validations to ensure that only allowed attributes are added and that the attribute value is a string.

**TESTING THE MODELS**

```console
PS C:\Projects\Engie-Coding-Test> rails db:migrate
PS C:\Projects\Engie-Coding-Test> rails db:seed
PS C:\Projects\Engie-Coding-Test> rails c
Loading development environment (Rails 7.0.4)
irb(main):001:0>customer = Customer.new
irb(main):002:0>customer.set_custom_attribute("email", "example@email.com")
irb(main):003:0>customer.get_custom_attribute("email") 

===========================================

irb(main):001:0>battery = Battery.new
irb(main):002:0>battery.set_custom_attribute("model", "excide")
irb(main):003:0>Battery.get_custom_attribute("model") 
```

**TESTS**

```console
PS C:\Projects\Engie-Coding-Test> rspec spec/migrations
```


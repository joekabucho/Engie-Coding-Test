module CustomAttributes
    extend ActiveSupport::Concern
  
    included do
      has_many :custom_attributes, as: :model, dependent: :destroy
    end
  
    def set_custom_attribute(name, value)
      if allowed_attribute?(name)
        if value.is_a?(String)
          if value.blank?
            raise ArgumentError, "attribute value cannot be blank"
          else
            custom_attribute = custom_attributes.find_or_initialize_by(attribute_name: name)
            custom_attribute.update(attribute_value: value)
          end
        else
          raise ArgumentError, "attribute value must be a string"
        end
      else
        raise ArgumentError, "attribute not allowed for this model"
      end
    end
  
    def get_custom_attribute(name)
      if allowed_attribute?(name)
        custom_attributes.find_by(attribute_name: name)&.attribute_value
      else
        raise ArgumentError, "attribute not allowed for this model"
      end
    end
  
    private
  
    def allowed_attribute?(name)
      ModelAttribute.exists?(model_name: self.class.name, attribute_name: name)
    end
  end
  
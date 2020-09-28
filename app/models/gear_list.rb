class GearList < ApplicationRecord
    has_many :items
    has_many :trips
    has_many :users, through: :trips

    # accepts_nested_attributes_for :items, reject_if: proc {|attributes| attributes["name"].blank?}

    def items_attributes=(items_attributes)
        items_attributes.each do |attr, value|
            
        # binding.pry
            unless value[:id].blank?
                self.items << Item.find_by(value)
            end
        end
    end
end

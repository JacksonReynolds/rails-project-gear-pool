class GearListItemsValidator < ActiveModel::Validator
    def validate(record)
        unless !record.gear_list.items.empty?
            record.errors[:items] << "The new gear list must have items added to it."
        end
    end
end
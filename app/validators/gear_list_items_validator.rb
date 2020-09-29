class GearListItemsValidator < ActiveModel::Validator
    def validate(record)
        puts 'validate'
        unless !record.gear_list.items.empty?
            puts 'errors'
            record.errors[:items] << "The new gear list must have items added to it."
        end
    end
end
class DropoffValidator < ActiveModel::Validator
    def validate(record)
        unless record.dropoff > record.pickup
            record.errors[:dropoff] << "must be a LATER time the pickup"
        end
    end
end
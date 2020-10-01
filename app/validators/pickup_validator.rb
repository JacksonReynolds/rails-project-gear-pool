class PickupValidator < ActiveModel::Validator
    def validate(record)
        unless record.pickup > Time.now
            record.errors[:pickup] << "must be in the FUTURE"
        end
    end
end
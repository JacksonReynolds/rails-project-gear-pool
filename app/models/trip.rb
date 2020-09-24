class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :gear_list
end

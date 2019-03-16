class Relationship < ApplicationRecord
    belongs_to :manito, :class_name => "User"
    belongs_to :manitee, :class_name => "User"
end

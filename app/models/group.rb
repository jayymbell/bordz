class Group < ApplicationRecord
    validates :name, :presence => true, uniqueness: {case_sensitive: false}
end

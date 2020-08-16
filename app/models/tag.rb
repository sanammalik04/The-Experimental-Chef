class Tag < ApplicationRecord
    has_and_belongs_to_many :recipes

    def self.all_cuisine_tags
        Tag.where(cuisine?: true)
    end

    def self.all_dietary_tags
        Tag.where(dietary?: true)
    end
    
end

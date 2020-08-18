class UserRecipe < ApplicationRecord
    belongs_to :recipe
    belongs_to :user

    validates :rating, :inclusion => { :in => 1..10, message: "must be between 1 and 10"}, if: :rating_not_nil?

    def rating_not_nil?
        self.rating != nil
    end
end

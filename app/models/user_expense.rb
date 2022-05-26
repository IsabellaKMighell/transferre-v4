class UserExpense < ApplicationRecord
    belongs_to :user

    validates :cost, presence:true, numericality: {only_float: true}
    validates :category, presence: true
end

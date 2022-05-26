class UserExpenseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :cost, :category
end

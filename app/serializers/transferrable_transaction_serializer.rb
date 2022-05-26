class TransferrableTransactionSerializer < ActiveModel::Serializer
  attributes :id, :transactor_id, :transactee_id, :cost, :category, :message, :confirmed, :transaction_to_user
end

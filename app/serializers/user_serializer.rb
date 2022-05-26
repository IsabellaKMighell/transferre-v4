class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :balance, :remainder, :password_digest
end

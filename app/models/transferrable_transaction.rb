class TransferrableTransaction < ApplicationRecord
    belongs_to :transactor, foreign_key: "transactor_id", class_name: "User"
    belongs_to :transactee, foreign_key: "transactee_id", class_name: "User"

    def initialize(attributes=nil)
        attr_with_defaults = {:confirmed => nil, :message => "hello"}.merge(attributes)
        super(attr_with_defaults)
    end
end

class User < ApplicationRecord
    has_secure_password

    has_many :user_expenses, dependent: :destroy
   
    has_many :transactor_transactions, foreign_key: :transactee_id, class_name: "TransferrableTransaction", dependent: :destroy
    has_many :transactors, through: :transactor_transactions, source: :transactor

  
    has_many :transactee_transactions, foreign_key: :transactor_id, class_name: "TransferrableTransaction", dependent: :destroy    
    has_many :transactees, through: :transactee_transactions, source: :transactee

    def initialize(attributes=nil)
        attr_with_defaults = {:balance => 0, :remainder => 0}.merge(attributes)
        super(attr_with_defaults)
    end
  
    validates :balance, presence:true, numericality:{only_float: true}
    validates :remainder, presence:true, numericality:{only_float: true}
end

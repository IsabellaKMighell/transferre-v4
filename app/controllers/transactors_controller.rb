
   
class TransactorsController < ApplicationController
    def index
        transactors = @current_user.transactors
        render json: transactors, render: :ok
    end

    def update
        confirmed_transaction = TransferrableTransaction.find_by(id: params[:id])
        confirmed_transaction.update!(confirmed: params[:confirmed])
        render json: confirmed_transaction, status: :ok
    end
    
    def create
        transactee = User.find(params[:transactee_id])
        transferrable_transaction = TransferrableTransaction.create!(
            transactor_id: @current_user.id, 
            transactee_id: transactee.id, 
            cost: params[:cost], 
            category: params[:category], 
            transaction_to_user: params[:transaction_to_user]
        )
        render json: transferrable_transaction, status: :created
    end
end
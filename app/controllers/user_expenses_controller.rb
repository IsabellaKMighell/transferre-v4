class UserExpensesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index   
        user_expenses = @current_user.user_expenses
        render json: user_expenses, status: :ok
    end

    def create 
        user_expense = @current_user.user_expenses.create!(expense_params)
        render json: user_expense, status: :created
    end

    def update
        user_expense = UserExpense.find_by(id: params[:id])
        user_expense.update!(expense_params)
        render json: user_expense, status: :ok
    end

    def destroy
        user_expense = UserExpense.find_by(id: params[:id])
        user_expense.destroy
        head :no_content
    end

    private 

    def expense_params
        params.permit(:cost, :category)
    end
    
    def render_not_found_response
        render json: {error: "Expense not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end

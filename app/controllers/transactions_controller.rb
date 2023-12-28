class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = current_user.categories.find(params[:category_id])

    @transactions = @category.related_transactions.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories.all
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.related_transactions.build(transaction_params)
    category_id = params[:group]
    @transaction.category_ids = category_id if category_id.present?
    if @transaction.save
      @category = Category.find(category_id) if category_id.present?
      redirect_to category_transactions_path(@category)
    else
      render :new
    end
  end

  def destroy; end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end

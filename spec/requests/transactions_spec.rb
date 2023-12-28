require 'rails_helper'
RSpec.describe 'Transactions', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }

  before do
    category.save
    sign_in user
  end
  it ' GET index' do
    get category_transactions_path(category_id: category.id)
    expect(response).to be_successful
  end

  it ' GET new' do
    get new_category_transaction_path(category_id: category.id)
    expect(response).to be_successful
  end

  it 'Creates new transaction' do
    puts category.inspect
    post category_transactions_path(category_id: category.id),
         params: { transaction: { name: 'New Transaction', amount: 10, category_id: category.id } }
    expect(response).to redirect_to(category_transactions_path(category_id: category.id))
  end
end

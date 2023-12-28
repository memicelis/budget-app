require 'rails_helper'

RSpec.describe 'Transactions', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  let(:transaction) { FactoryBot.create(:transaction, user:, categories: [category]) }

  before do
    category.save
    transaction.save
    sign_in user
  end

  describe 'index' do
    it 'renders a page' do
      visit category_transactions_path(category_id: category.id)
      expect(page).to have_content('Transactions')
      expect(page).to have_button('Logout')
      expect(page).to have_link('Add new transaction')
      expect(page).to have_content(transaction.name)
      expect(page).to have_content(transaction.amount)
    end
  end

  describe 'new' do
    it 'renders a page' do
      visit new_category_transaction_path(category_id: category.id)
      expect(page).to have_content('Add New Transaction')
      expect(page).to have_button('Logout')
      expect(page).to have_button('Save')
      expect(page).to have_selector("input[type='text'][placeholder='Name']")
      expect(page).to have_selector("input[type='text'][placeholder='Amount']")
    end
  end
end

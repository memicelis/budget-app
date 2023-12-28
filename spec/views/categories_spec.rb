require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }

  before do
    category.save
    sign_in user
  end

  describe 'index' do
    it 'renders a page' do
      visit categories_path
      expect(page).to have_content('Home')
      expect(page).to have_button('Logout')
      expect(page).to have_link('Add new category')
      expect(page).to have_content(category.name)
      expect(page).to have_css("img[src='#{category.icon}']")
    end
  end

  describe 'new' do
    it 'renders a page' do
      visit new_category_path
      expect(page).to have_content('Add New Category')
      expect(page).to have_button('Logout')
      expect(page).to have_link('<')
      expect(page).to have_selector("input[type='text'][placeholder='Name']")
      expect(page).to have_selector("input[type='text'][placeholder='Icon']")
      expect(page).to have_button('Save')
    end
  end
end

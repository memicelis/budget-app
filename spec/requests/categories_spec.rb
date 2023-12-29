require 'rails_helper'
RSpec.describe 'Categories', type: :request do
  let(:user) { FactoryBot.build(:user) }

  before do
    user.save
    sign_in user
  end
  it ' GET index' do
    get categories_path
    expect(response).to be_successful
  end

  it ' GET new' do
    get new_category_path
    expect(response).to be_successful
  end

  it 'Create new category' do
    post categories_path, params: { category: { name: 'New Category', icon: 'icon.png' } }
    expect(response).to redirect_to(categories_path)
  end
end

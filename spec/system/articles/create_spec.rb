require 'rails_helper'

RSpec.describe 'create article', type: :system do
  before do
    login_as(FactoryBot.create(:user))
  end
  scenario 'empty title and url' do
    visit new_article_path
    click_button 'Create article'

    # The page should show error message 'Title can't be blank'
    expect(page).to have_content("Title can't be blank")

    # No bookmark record is created
    expect(Bookmark.count).to eq(0)
  end
  
  # happy path scenario block
  scenario 'valid title and body' do
    visit new_article_path
    # fill in text fields with specified string
    fill_in 'Title', with: 'RubyYagi'
    fill_in 'body', with: 'https://rubyyagi.com'
    click_button 'Create article'
    
    # The page should show success message
    expect(page).to have_content("article was successfully created")

    # 1 new bookmark record is created
    expect(Bookmark.count).to eq(1)
    
    # Optionally, you can check the latest record data
    expect(Bookmark.last.title).to eq('RubyYagi')
  end
end
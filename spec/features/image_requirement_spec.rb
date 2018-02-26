require 'rails_helper.rb'

feature "Can't create post" do
  scenario "with no image" do
    user = create :user
    sign_in_with user
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Hello'
    click_button 'Create Post'
    expect(page).to have_content('You need an image to post!')
  end
end

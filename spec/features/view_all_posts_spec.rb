require 'rails_helper'

feature 'User visit index page' do

  background do
    user = create :user
    post_one = create(:post, caption: 'Hello there, post one',
                            user_id: 1)
    post_two = create(:post, caption: 'Hello there, post twi.two',
                            user_id: 1)

    sign_in_with user
  end

  scenario 'posts and captions viewable' do
    visit '/'
    expect(page).to have_content('Hello there, post one')
    expect(page).to have_content('Hello there, post twi.two')
    expect(page).to have_css("img[src*='coffee']")

  end
end

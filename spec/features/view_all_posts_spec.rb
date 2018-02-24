require 'rails_helper'

feature 'User visit index page' do
  scenario 'posts and captions viewable' do
    post_one = create(:post, caption: 'Hello there, post one')
    post_twi = create(:post, caption: 'Hello there, post twi.two')
    visit '/'
    expect(page).to have_content('Hello there, post one')
    expect(page).to have_content('Hello there, post twi.two')
    expect(page).to have_css("img[src*='coffee']")

  end
end

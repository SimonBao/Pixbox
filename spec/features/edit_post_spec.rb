# create a post with factory_girl
# visit the root route
# click the image of the post we created with factory_girl
# click the 'edit post' link
# fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
# click the ’Update Post’ button
# expect the page to have content saying "Post updated hombre."
# expect the page to have content saying “Oh god, you weren’t meant to see this picture!”

require 'rails_helper'

feature 'Editing a post' do
  scenario 'edits post' do
    post = create(:post, caption: "Edit me!")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit me!')
    click_link 'Edit Post'
    fill_in 'Caption', with: "Woohoo I've transformed!"
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content("Woohoo I've transformed!")
  end
end

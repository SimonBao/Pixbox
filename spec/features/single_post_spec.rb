require 'rails_helper'

feature 'Can view individual posts' do
  background do
    @post = create(:post)
    @post2 = create(:post)
  end

  scenario 'Can click and view the first post' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(@post))
  end

  scenario 'Can click and view the second post' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/2')]").click
    expect(page.current_path).to eq(post_path(@post2))
  end
end

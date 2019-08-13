require 'rails_helper'

describe 'tag show page' do
  it 'user links from article show to tag show' do
    article = Article.create!(title: "My Article", body: "My body.")
    tag = article.tags.create!(name: "ruby")

    visit article_path(article)
    click_link 'ruby'

    expect(current_path).to eq(tag_path(tag))
    expect(page).to have_content('ruby')
  end
end

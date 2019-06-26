require 'rails_helper'

describe 'user sees one article' do
  describe 'user links from article index' do
    it 'displays info for one article' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path

      click_link article_1.title

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to_not have_content(article_2.title)
    end
  end
end
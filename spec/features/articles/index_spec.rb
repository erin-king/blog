require 'rails_helper'

describe 'user sees all articles' do
  describe 'user visits /articles' do
    it 'shows all articles' do
      article_1 = Article.create!(title: "Title 1", body: 'Body 1')
      article_2 = Article.create!(title: "Title 2", body: 'Body 2')

      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
      expect(page).to have_link("Create a New Article")
    end
  end
end

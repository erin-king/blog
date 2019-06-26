require 'rails_helper'

describe 'user can edit an article' do
  describe 'user visits article show page' do
    describe 'user clicks on Edit Article link' do
      it 'can change the title and body of an article' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit articles_path

        click_link article_1.title

        click_link 'Edit Article'

        expect(current_path).to eq(edit_article_path(article_1))

        fill_in "article[title]", with: 'Edited Title'
        fill_in "article[body]", with: 'Edited Body'

        click_button 'Update Article'

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("Edited Title")
        expect(page).to have_content("Edited Body")
      end
    end
  end
end

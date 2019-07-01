require 'rails_helper'

describe 'user sees one article' do
  describe 'user links from article index' do
    before :each do
      @article_1 = Article.create!(title: "Title 1", body: "Body 1")
      @article_2 = Article.create!(title: "Title 2", body: "Body 2")
      @comment_1 = @article_1.comments.create!(author_name: "Name 1", body: "Some comments.")
      @comment_2 = @article_1.comments.create!(author_name: "Name 2", body: "Some more comments.")

      visit articles_path

      click_link @article_1.title
    end

    it 'displays info for one article' do
      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to have_content(@comment_1.author_name)
      expect(page).to have_content(@comment_1.body)
      expect(page).to have_content(@comment_2.author_name)
      expect(page).to have_content(@comment_2.body)
      expect(page).to_not have_content(@article_2.title)
    end

    it 'has a delete link that deletes the article' do
      expect(page).to have_link("Delete Article")

      click_link "Delete Article"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@article_2.title)
      expect(page).to_not have_content(@article_1.title)
    end
  end

  describe 'they fill in a comment form' do
    it 'displays the comment on the article show' do
      article = Article.create!(title: "The Best Article", body: "Article's very good body.")

      visit article_path(article)

      fill_in "comment[author_name]", with: "The Author"
      fill_in "comment[body]", with: "The body."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("The Author")
      expect(page).to have_content("The body.")
    end
  end
end

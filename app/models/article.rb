class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title
  validates_presence_of :body

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  # def tag_list
  #   list = ""
  #   tags.map do |tag|
  #     list << tag.name + ", "
  #   end
  #   list.to_s.chomp(', ')
  # end

end

class AuthorPostSerializer < ActiveModel::Serializer
  attributes :title, :short_content

  def short_content
    "#{object.content[0..39]}..."
  end

  has_many :tags
end

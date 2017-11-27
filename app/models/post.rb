class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :body,
    presence: { message: "なんかかいてやし( ·ω·｀)" },
    length: {minimum: 2, message: 'みじかすぎやし(´·ω·｀)'}
end

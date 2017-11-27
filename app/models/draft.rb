class Draft < ApplicationRecord
  validates :title, :body,
    presence: { message: "なんかかいてやし( ·ω·｀)" },
    length: {minimum: 2, message: 'みじかすぎやし(´·ω·｀)'}
end

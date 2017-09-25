class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :validate_title


  def validate_title
    phrases = ["Won't Believe", "Secret", "Top [number]}", "Guess"]
    if self.title

      phrases.each do |phrase|
        if self.title.include?(phrase)
          return
        end
      end
      self.errors[:title] << "Need a title with a clickbait-y title"
    end
  end



end

class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait?



    def clickbait?
        clickbait_array = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
          clickbait_counter = 0 
          clickbait_array.each do |term|
                if self.title.includes(term)
                    clickbait_counter += 1
                 end
            end
            if clickbait_counter > 0
                errors.add(:title, "must be clickbait")
            end
    end



end

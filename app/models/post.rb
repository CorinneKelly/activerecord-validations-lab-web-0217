class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :clickbait

	def clickbait
		bait_array = ["Won't Believe", "Secret", "Top", "Guess"]
		bait_array.each do |clickbait|
			if title.present? && !title.include?(clickbait)
				errors.add(:title, "WHY YOU MESSIN WITH MY SITE")
				return false
			else
				return true
			end
		end
	end



end

class Post < ActiveRecord::Base
	validates :title, length: {maximum: 500}
end

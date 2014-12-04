class Post < ActiveRecord::Base

	validates :titulo, :presence => true
	validates :contenido, :presence => true
	validates :user_id, :presence => true


	belongs_to :user
end

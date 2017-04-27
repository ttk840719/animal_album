class Animal < ApplicationRecord
	has_attached_file :image, styles: { medium: "300x300#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	belongs_to :user
	validates :title, :description, :image, presence: { message: "need to fill out the form!" } 

end

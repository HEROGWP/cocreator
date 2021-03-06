class Category < ApplicationRecord
	validates_presence_of :name, :message => "不能是空！！！"

	has_attached_file :logo, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/category.jpg"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_many :project_categoryships, :dependent => :destroy
  has_many :projects , :through => :project_categoryships
  has_many :user_categoryships, :dependent => :destroy
  has_many :users , :through => :user_categoryships

	scope :order_updated, -> { order('updated_at DESC') }
end

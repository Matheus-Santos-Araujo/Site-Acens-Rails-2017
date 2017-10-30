class Portfolio < ApplicationRecord
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/articles/photos/missing/:style/missing.jpg"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
  validates_presence_of :title, :subtitle, :description, :banner, :client_name
  has_many :pictures, :dependent => :destroy
end
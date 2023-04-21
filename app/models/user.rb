class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  
  has_many :books
  
  validates :name, length: {minimum:2, maximum:20}
  validates :introduction, length: {maximum:50}
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    else
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
end

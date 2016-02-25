class User < ActiveRecord::Base
  has_one :lunchrequest

  def full_profile?
    avatar? && name? && sex && department && message?
  end


# データベースに1足して、更新する作業
  def increment_like!
    incremented_like = like + 1
    update({like: incremented_like})
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

end

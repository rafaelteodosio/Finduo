class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_commontator
  acts_as_commontable dependent: :destroy



  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :letter, :styles => { :large => " 595X842>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :letter, :content_type => /\Aimage\/.*\Z/

  has_reputation :votes, source: :user, aggregated_by: :sum

  def voted_for?(user)
    evaluations.where(target_id: user.id).present?
  end

  def self.search(query)
    where("elo like ?", query)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

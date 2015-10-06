class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :image, presence: true
  validates :description, presence: true
  before_save :price_adjustment_for_stripe

  def price_adjustment_for_stripe
    self.price = (self.price * 100).to_i
  end

end

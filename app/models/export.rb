class Export < ActiveRecord::Base

  belongs_to :user
  before_validation :generate_token, :on => :create

  has_attached_file :attachment
  validates_attachment :attachment, :presence => true,
    :content_type => { :content_type => /.*/ },
    :size => { :in => 0..1.gigabyte }

  protected

  def generate_token
    self.token = SecureRandom.hex(20)
  end

end

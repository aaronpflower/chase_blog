class Admin < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :comments, through: :posts

  before_save { self.email = email.downcase }
 #  attr_accessor :password
	before_create :create_remember_token # this is a callback method to create a remember token immediately nefore creating a new user in the database

	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
 #  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } # validates method ensures the email attribute exists in an admin hash before it is saved
 #  validates :password, length: { minimum: 6 }
	has_secure_password

	def Admin.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Admin.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    # this method is only used internally by the Admin model, so no need to expose it to outside users
    def create_remember_token
      self.remember_token = Admin.digest(Admin.new_remember_token) # the self keyword assigns the method to one of the admins attributes
      # without the self assignment there would be an local variable called remember_token
    end
end

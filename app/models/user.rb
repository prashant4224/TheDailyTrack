class User < ActiveRecord::Base
  include Commentable
	has_many :posts
	has_many :photo_holder, as: :photo_holder
  has_many :tickets, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, #:confirmable,
         :omniauthable

  validates :name, presence: true # :dob, presence: true
  validates :terms_of_service, acceptance: true

  has_attached_file :avatar, :styles => { :tiny => "25x25>", :small => "50x50>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_image.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Paperclip::Attachment.default_options[:default_url] = "/images/default_image.png"

  #accepts_nested_attributes_for :images
	
	def self.from_omniauth(auth)
    puts auth
    where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create do |user|
      puts "user: "
      puts user.inspect
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = self.process_uri(auth.info.image) # assuming the user model has an image
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.provider == "twitter" 
         user.save(:validate => false) 
       else
         user.save
       end
       puts user.errors.inspect
    end
  end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end

  private

  def self.process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

end

require 'digest/sha2'

class User < ApplicationRecord
	validates :user_name, :email, :presence => true, :uniqueness => true
	validates :password, :confirmation => true
	validates_length_of :user_name, :minimum => 6
	validates_format_of :password, :with => /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}\z/
	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present
	before_destroy :check_if_has_confirmed

	ROLE_ENUM = [ "Admin","Editor"]

	def is_admin?
		if self.role == 'Admin'
			return true
		else return false
		end
	end
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + salt)
	end

	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password,salt)
		end
	end

	def User.authenticate(user_name,password)
		if user = find_by_user_name(user_name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end

private
	def password_must_be_present
		if hashed_password.present? == false
			errors.add(:password, "Missing password")
		end
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	def check_if_has_confirmed
		if confirms.empty?
			return true
		else
			return false
		end
	end
end

class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
end
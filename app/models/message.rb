class Message < ActiveRecord::Base
	validates_presence_of :firstname, :lastname, :phonenumber, :email
end
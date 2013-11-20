class User < ActiveRecord::Base
	rolify
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

	after_create :add_user_to_mailchimp
	before_destroy :remove_user_from_mailchimp

	private

	def add_user_to_mailchimp
	    return if email.include?(ENV['ADMIN_EMAIL'])
	    mailchimp = Gibbon::API.new
	    result = mailchimp.lists.subscribe({
	    	:id => ENV['MAILCHIMP_LIST_ID'], 
	    	:email => {:email => self.email},
	    	:double_optin => false, 
	    	:merge_vars => {:FNAME => self.firstname, :LNAME => self.name},
	    	:update_existing => true,
	      	:send_welcome => true
	    	})

	    Rails.logger.info("=========> #{self.firstname} & #{self.name}")

	    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
		rescue Gibbon::MailChimpError => e
	    Rails.logger.info("MailChimp subscribe failed for #{self.email}: " + e.message)
	end

	def remove_user_from_mailchimp
	    mailchimp = Gibbon::API.new
	    result = mailchimp.lists.unsubscribe({
	      :id => ENV['MAILCHIMP_LIST_ID'],
			:email => {:email => self.email},
	    	:double_optin => false, 
	    	:merge_vars => {:FNAME => self.firstname, :LNAME => self.name},
	    	:update_existing => true,
	      	:send_welcome => true
	    	})
	    
	    Rails.logger.info("Unsubscribed #{self.email} from MailChimp") if result
	  	rescue Gibbon::MailChimpError => e
	    Rails.logger.info("MailChimp unsubscribe failed for #{self.email}: " + e.message)
	end
end

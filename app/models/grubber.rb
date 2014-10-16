class Grubber < ActiveRecord::Base
	require 'mandrill'
	scope :subscribed, ->{ where(subscribed: true) }
	scope :emailable, ->{ where(email_ok: true, subscribed: true) }
	scope :textable, ->{ subscribed.where(text_ok: true) }
	validates :password, presence: true
	before_create :configure_new_grubber
	
	def configure_new_grubber
		self.subscribed = true
	  	if self.mobile.present?
	  		self.text_ok = true
	  	end
	  	if self.email.present?
	  		self.email_ok = true
	  	end
	end

	def send_email(message_body)
		m = Mandrill::API.new
	    recipient = [{email: self.email}]
	    message = {  
	  	 :subject=> "Grub Alert!",  
	  	 :from_name=> "Grub Tracker",  
	  	 :text=> message_body,  
	  	 :to=> recipient,  
	  	 :html=>"<html><h1>#{message_body}</h1></html>",  
	  	 :from_email=>"brian@nycda.com"  
	  	}  
	  	sending = m.messages.send message  
	  	puts sending
	end

	def self.email_grubbers(message_body)
	  	Grubber.emailable.each do |grubber|
	  		grubber.send_email(message_body)
	  	end
	end
end

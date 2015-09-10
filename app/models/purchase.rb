class Purchase < ActiveRecord::Base
	def to_param
	 uuid
	end
	after_create :email_purchaser

	private

	def email_purchaser
	   PurchaseMailer.purchase_receipt(self).deliver
	end
end

class Notification < ApplicationMailer

  def finish_product_export(user)
    mail( :to => user.email, :subject => "Finish export")
  end

end

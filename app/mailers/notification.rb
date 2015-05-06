class Notification < ApplicationMailer

  def finish_product_export(export)
    @export = export
    @user = export.user

    mail( :to => @user.email, :subject => "Finish export")
  end

end

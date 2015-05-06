class ExportsController < ApplicationController

  def create
    ProductExporterJob.perform_later( User.first )
    redirect_to :back, :notice => "Plase wait! E-mail is coming!"
  end

  def show
    @export = Export.find_by_token( params[:id] )
    if @export
      send_file @export.attachment.path
    else
      raise ActiveRecord::RecordNotFound
    end
  end

end

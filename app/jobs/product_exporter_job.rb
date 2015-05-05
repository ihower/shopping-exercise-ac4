class ProductExporterJob < ActiveJob::Base
  queue_as :default

  def perform(user)
  end

end

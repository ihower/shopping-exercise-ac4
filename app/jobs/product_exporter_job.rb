require 'csv'
class ProductExporterJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    export = Export.new( :user => user )

    csv_string = CSV.generate do |csv|
      csv << ["ID", "Name", "Price", "Description"]

      Product.find_each do |p|
        csv << [ p.id, p.name, p.price, p.description]
      end
    end

    begin
      file_name = "/tmp/products-#{Date.today.to_s}-#{Time.now.to_i}.csv"
      outfile = File.open(file_name, "w")
      outfile << csv_string
      export.attachment = outfile
      export.save!
    ensure
      outfile.close
      File.delete(file_name)
    end

    Notification.finish_product_export(export).deliver_now!
  end

end

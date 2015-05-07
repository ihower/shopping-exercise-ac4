namespace :dev do

  task :demo => :environment do
    Rails.logger.info("TEST cron!!!!!")
  end

  task :fake => :environment do
    Product.delete_all

    100.times do
      Product.create!( :name => Faker::App.name,
                       :price => ( rand(100)+1 ) * 10 ,
                       :image_url => Faker::Avatar.image,
                       :description => Faker::Lorem.paragraph,
                       :in_stock_qty => rand(10) )
    end
  end

end
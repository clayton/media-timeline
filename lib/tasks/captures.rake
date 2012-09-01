desc "Update the hour infomation on captures"
namespace :captures do
  task :update_hour_captured => :environment do
    Capture.where(:year_captured => nil).each do |c|
      c.year_captured  = c.created_at.year
      c.month_captured = c.created_at.month
      c.day_captured   = c.created_at.day
      c.hour_captured  = c.created_at.hour
      c.save
    end
  end
end
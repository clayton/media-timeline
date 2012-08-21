namespace :sites do
  desc "Capture screenshots and page source"
  task :capture => :environment do
    Site.all.each do |site|
      puts "Capturing: #{site.name}"
      site.captures.create
    end
  end
end
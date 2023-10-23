namespace :mqtt do
  desc "TODO"
  task start: :environment do
  	puts "starting client"
  	Mqtt::Server.new.start
  end

end

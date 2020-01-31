require "bundler"
require_relative "models/worksheet"
require_relative "models/session"
require_relative "models/user_details"

Bundler.require

get "/" do
  erb :index
end

post "/" do
  user_details = UserDetails.new(params["name"], params["email"], params["phone_number"])
  if user_details.valid?
    begin
      session = Session.new.session
      worksheet = Worksheet.new(session).worksheet
      worksheet.insert_rows(worksheet.num_rows + 1, [user_details.to_row])
      worksheet.save
      erb :thanks
    rescue Exception => e
      puts e.full_message
      erb :index, locals: {
                    error_message: "Your details could not be saved, please try again.",
                  }
    end
  else
    erb :index
  end
end

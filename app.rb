require "bundler"
require_relative "models/worksheet.rb"
require_relative "models/session.rb"

Bundler.require

get "/" do
  erb :index
end

post "/" do
  new_row = [params["name"], params["email"], params["phone_number"]]
  begin
    session = Session.new.session
    worksheet = Worksheet.new(session).worksheet
    worksheet.insert_rows(worksheet.num_rows + 1, [new_row])
    worksheet.save
    erb :thanks
  rescue Exception => e
    puts e.full_message
    erb :index, locals: {
      error_message: "Your details could not be saved, please try again."
    }
  end
end

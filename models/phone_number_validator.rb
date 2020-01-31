Bundler.require
Envyable.load("./config/env.yml", "twilio_config")

class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    begin
      response = client.lookups.phone_numbers(value).fetch
    rescue Twilio::REST::RestError => error
      if error.code == 20404
        record.errors[attribute] << (options[:message] || 'is not a valid phone number')
      else
        raise error
      end
    end
  end
end

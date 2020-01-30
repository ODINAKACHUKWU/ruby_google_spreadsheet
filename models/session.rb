class Session
  SECRET = "client_secret.json".freeze

  attr_reader :session

  def initialize
    @session = GoogleDrive::Session.from_service_account_key(SECRET)
  end
end

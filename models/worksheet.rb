class Worksheet
  SPREADSHEET = "New App".freeze

  attr_reader :worksheet

  def initialize(session)
    @spreadsheet = session.spreadsheet_by_title(SPREADSHEET)
    @worksheet = @spreadsheet.worksheets.first
  end
end

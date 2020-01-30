require 'bundler'

Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Legislators 2017")

# Get the first worksheet
worksheet = spreadsheet.worksheets.first

# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }

# Insert a single row above the first row of data
worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
worksheet.save

# Insert a row at the bottom of all existing rows
worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])
worksheet.save

# Update a cell by referencing its row and column numbers [row, column]
worksheet[2, 1] = "Updated!"
worksheet.save

# Update a cell by using the cell name
worksheet["A2"] = "Updated again!"
worksheet.save

# Deleting rows is like inserting rows, you need to provide the row number and how many rows you’d like to delete
worksheet.delete_rows(2, 1)
worksheet.save

# Delete the last row of all existing rows
worksheet.delete_rows(worksheet.num_rows, 1)
worksheet.save

# Ruby Google Spreadsheet

This is a sample application that uses Sinatra to host a site that saves data in a Google Sheet.

## Running the application

### Get setup with Google Sheets

Follow the steps in [this blog post](https://www.twilio.com/blog/2017/03/google-spreadsheets-ruby.html) to create the credentials for a service account in the Google APIs Console. Download the credentials and copy them to this project with the filename `client_secret.json`.

You will also need to create a blank spreadsheet and give your service account access to edit.

### Download, prepare and start the app

Clone this repository with the command:

```bash
git clone https://github.com/ODINAKACHUKWU/ruby_google_spreadsheet.git
cd ruby_google_spreadsheet
```

Install the dependencies:

```bash
bundle install
```

Start the app:
```bash
bundle exec ruby app.rb
```

Visit:
`http://localhost:4567`

### Learning source:
[Twilio blog: by PHIL NASH](https://www.twilio.com/blog/2017/03/create-a-landing-page-with-sinatra-google-spreadsheets-and-ruby.html)

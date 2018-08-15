require 'google_drive'
require 'ruboty/dictionary/google_spreadsheet/client'

module Ruboty
  module Dictionary
    module GoogleSpreadsheet
      class Spreadsheet
        attr_reader :client

        def initialize
          @client = Ruboty::Dictionary::GoogleSpreadsheet::Client.new(
            client_id: ENV['DICTIONARY_GOOGLE_CLIENT_ID'],
            client_secret: ENV['DICTIONARY_GOOGLE_CLIENT_SECRET'],
            redirect_uri: ENV['DICTIONARY_GOOGLE_REDIRECT_URI'],
            refresh_token: ENV['DICTIONARY_GOOGLE_REFRESH_TOKEN']
          )
          @client.authorize!
        end

        def rows
          worksheet.list.to_hash_array
        end

        def worksheet
          spreadsheet.worksheets[0]
        end

        private

        def spreadsheet
          @spreadsheet ||= session.spreadsheet_by_key(ENV['DICTIONARY_SPREADSHEET_KEY'])
        end

        def session
          @session ||= GoogleDrive.login_with_oauth(@client.access_token)
        end
      end
    end
  end
end

require 'ruboty/dictionary/google_spreadsheet/spreadsheet'

module Ruboty
  module Dictionary
    module Actions
      class ShowUrl < Ruboty::Actions::Base
        def call
          message.reply(spreadsheet_url)
        end

        private

        def spreadsheet_url
          "https://docs.google.com/spreadsheets/d/#{ENV['DICTIONARY_SPREADSHEET_KEY']}/edit#gid=0"
        end
      end
    end
  end
end

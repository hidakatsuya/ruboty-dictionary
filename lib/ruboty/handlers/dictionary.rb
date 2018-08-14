require 'ruboty/dictionary/actions/lookup'

module Ruboty
  module Handlers
    class Dictionary < Base
      env :DICTIONARY_GOOGLE_CLIENT_ID, 'Google Client ID for Dictionary'
      env :DICTIONARY_GOOGLE_CLIENT_SECRET, 'Google Client secret for Dictionary'
      env :DICTIONARY_GOOGLE_REDIRECT_URI, 'Google Redirect URI for Dictionary'
      env :DICTIONARY_GOOGLE_REFRESH_TOKEN, 'Google Refresh token issued with access token for Dictionary'
      env :DICTIONARY_SPREADSHEET_KEY, 'Google Spreadsheet key for Dictionary (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)'
      env :DICTIONARY_WORD_COLUMN_NAME, 'Name for word column'
      env :DICTIONARY_DESCRIPTION_COLUMN_NAME, 'Name for description column'
      env :DICTIONARY_NOTE_COLUMN_NAMES, 'Comma separeted names for note columns', optional: true

      on /dictionary lookup (?<word>.+)/, name: 'dictionary_lookup', description: 'Lookup word in the dictionary'

      def dictionary_lookup(message)
        Ruboty::Dictionary::Actions::Lookup.new(message).call
      end
    end
  end
end    

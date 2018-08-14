require 'googleauth'

module Ruboty
  module Dictionary
    module GoogleSpreadsheet
      class Client
        SCOPE = %w(
          https://www.googleapis.com/auth/drive
          https://spreadsheets.google.com/feeds/
        )

        attr_reader :credentials

        def initialize(client_id:, client_secret:, redirect_uri:, refresh_token:)
          @credentials = Google::Auth::UserRefreshCredentials.new(
            client_id: client_id,
            client_secret: client_secret,
            scope: SCOPE,
            redirect_uri: redirect_uri
          )
          @refresh_token = refresh_token
        end

        def authorize!
          @credentials.refresh_token = @refresh_token
          @credentials.fetch_access_token!

          @refresh_token = @credentials.refresh_token
        end
      end
    end
  end
end

require 'ruboty/dictionary/google_spreadsheet/spreadsheet'

module Ruboty
  module Dictionary
    module Actions
      class Lookup < Ruboty::Actions::Base
        def call
          return nil unless message[:word]

          row = find_by_word(message[:word])
          if row
            message.reply(build_detail(row))
          else
            message.reply('Not found')
          end
        end

        private

        def spreadsheet
          @spreadsheet ||= Dictionary::GoogleSpreadsheet::Spreadsheet.new
        end

        def find_by_word(word)
          spreadsheet.rows.find { |row| row.fetch(ENV['DICTIONARY_WORD_COLUMN_NAME']) == word }
        end

        def build_detail(row)
          detail = []
          detail << row.fetch(ENV['DICTIONARY_DESCRIPTION_COLUMN_NAME'])

          note_column_names = ENV['DICTIONARY_NOTE_COLUMN_NAMES']&.split(',') || []
          note_column_names.reject! { |name| row[name].nil? || row[name].empty? }
          detail += note_column_names.map { |name| "> #{name} = #{row[name]}" } if note_column_names.any?

          detail.join("\n")
        end
      end
    end
  end
end

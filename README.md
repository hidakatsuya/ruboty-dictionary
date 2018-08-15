# Ruboty::Dictionary

Ruboty plug-in to look up a word in the custom dictionary.

## Installation

```ruby
# Gemfile
gem 'ruboty-dictionary'
```

## ENV

```
DICTIONARY_GOOGLE_CLIENT_ID, 'Google Client ID for Dictionary'
DICTIONARY_GOOGLE_CLIENT_SECRET, 'Google Client secret for Dictionary'
DICTIONARY_GOOGLE_REDIRECT_URI, 'Google Redirect URI for Dictionary'
DICTIONARY_GOOGLE_REFRESH_TOKEN, 'Google Refresh token issued with access token for Dictionary'
DICTIONARY_SPREADSHEET_KEY, 'Google Spreadsheet key for Dictionary (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)'
DICTIONARY_WORD_COLUMN_NAME, 'Name for word column'
DICTIONARY_DESCRIPTION_COLUMN_NAME, 'Name for description column'
DICTIONARY_NOTE_COLUMN_NAMES, 'Comma separeted names for note columns', optional: true
```

## Usage

```
@ruboty dictionary lookup word-you-want-to-look-up
```

## Todo

- [ ] Add `dictionary list` handler
- [ ] Add spec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/ruboty-dictionary.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

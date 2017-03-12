
require 'opentok'

# Wrapper for API class OpenTok
# https://tokbox.com/developer/sdks/ruby/
#
class VideoOpenTok

  OPEN_TOK = OpenTok::OpenTok.new Settings.api_key, Settings.api_secret

  def self.api_key
    Settings.api_key
  end

  def self.generate_token(session_id)
    OPEN_TOK.generate_token(session_id)
  end

  def self.create_session_id
    OPEN_TOK.create_session.session_id
  end

end
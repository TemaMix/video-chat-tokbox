class NewGroupForm < Reform::Form

  property :name
  property :session_id, deserializer: { parse_pipeline: ->(*) { ->(input, represented:, **) { represented.session_id = VideoOpenTok.create_session_id }} }

  validates :name, presence: true
  # validates :session_id, presence: true

end
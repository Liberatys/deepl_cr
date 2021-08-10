require "./request.cr"
require "./response.cr"
require "habitat"

module Deepl
  VERSION = "0.1.0"

  class Dispatcher
    Habitat.create do
      setting api_key : String
    end

    def self.translate(value : String, from : String, to : String)
      Deepl::Request.new(
        api_key: settings.api_key,
        request_payload: [{
          "text", value,
        },
        {
          "source_lang", from,
        },
        {
          "target_lang", to,
        },
        ]
      ).dispatch
    end
  end
end

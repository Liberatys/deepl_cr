require "http"
require "json"

module Deepl
  class Response
    private getter status_code : Int32
    private getter body : String

    def initialize(http_response : Crest::Response)
      @status_code = http_response.status_code
      @body = http_response.body
    end

    def parsed_body
      @body
    end

    def translations
      JSON.parse(body)["translations"]
    end
  end
end

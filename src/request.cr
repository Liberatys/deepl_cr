require "crest"

module Deepl
  class Request
    TOKEN_NAME = "DeepL-Auth-Key"
    BASE_URI   = "api-free.deepl.com"
    END_POINT  = "v2/translate"

    private getter api_key : String
    private getter request_payload : Hash(String, String)

    def initialize(@api_key, @request_payload)
    end

    def dispatch : Deepl::Response
      response = Crest.post(
        resource_url,
        form: request_payload,
        headers: {"Authorization" => "#{TOKEN_NAME} #{api_key}"}
      )
      Deepl::Response.new(response)
    end

    private def resource_url
      "https://#{BASE_URI}/#{END_POINT}"
    end
  end
end

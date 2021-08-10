require "crest"

module Deepl
  class Request
    TOKEN_NAME = "DeepL-Auth-Key"
    BASE_URI   = "api-free.deepl.com"
    END_POINT  = "v2/translate"

    private getter api_key : String
    private getter request_payload : Array(Tuple(String, String))

    def initialize(@api_key, @request_payload)
    end

    def dispatch : Deepl::Response
      request = Crest::Request.new(:post, resource_url, params: request_payload.to_h) do |request|
        request.headers.add("Authorization", "#{TOKEN_NAME} #{api_key}")
      end
      Deepl::Response.new(request.execute)
    end

    private def resource_url
      "https://#{BASE_URI}/#{END_POINT}"
    end

    private def request_params
      String.build do |str|
        request_payload.each do |key, value|
          str << key << "=" << value
          str << "&"
        end
      end.chomp("&")
    end
  end
end

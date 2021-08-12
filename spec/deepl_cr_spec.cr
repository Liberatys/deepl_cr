require "./spec_helper"

describe Deepl do
  it "translate" do
    WebMock.stub(:post, "https://api-free.deepl.com/v2/translate")
      .with(body: "text=hello&source_lang=EN&target_lang=DE", headers: {"Authorization" => "DeepL-Auth-Key key:fx"})
      .to_return(status: 200, body: {"translations" => [{"detected_source_language" => "EN", "text" => "Hallo"}]}.to_json)

    Deepl::Dispatcher.configure do |settings|
      settings.api_key = "key:fx"
    end

    Habitat.raise_if_missing_settings!

    resp = Deepl::Dispatcher.translate("hello", from: "EN", to: "DE")
    resp.translations.should eq([{"detected_source_language" => "EN", "text" => "Hallo"}])
  end
end

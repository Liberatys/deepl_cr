# deepl_cr

A shard for translations with deepl

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     deepl_cr:
       github: Liberatys/deepl_cr
   ```

2. Run `shards install`

## Usage

```crystal
require "deepl_cr"

Deepl::Dispatcher.configure do |settings|
  settings.api_key = ENV["DEEPL_API_KEY"]
end

Habitat.raise_if_missing_settings!

Deepl::Dispatcher.translate("key to translate", from: "EN", to: "DE")
```

## Development

1. Fork it (<https://github.com/Liberatys/deepl_cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Liberatys](https://github.com/Liberatys) - creator and maintainer

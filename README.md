# twitter-iremocon

twitter-iremocon is a simple script to send iremocon signal by tweet stream

## Installation

```sh
bundle
```

## Usage

```sh
cat config.yml.sample > config.yml # And edit twitter setting
ruby bin/twitter-iremocon.rb
```

## Supported Ruby
- 1.9.3

Ruby 2.0 is not supported because `TweetStream` does not currently work with it.


## License
twitter-iremocon is released under the MIT License.

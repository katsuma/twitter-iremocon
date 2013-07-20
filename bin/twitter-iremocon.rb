# coding: utf-8
require 'yaml'
require 'tweetstream'
require 'iremocon'

yml = YAML.load_file('config.yml')

iremocon_config = yml['iremocon']
aircon = iremocon_config['aircon']

TweetStream.configure do |config|
  tw = yml['twitter']
  config.consumer_key       = tw['consumer_key']
  config.consumer_secret    = tw['consumer_secret']
  config.oauth_token        = tw['oauth_token']
  config.oauth_token_secret = tw['oauth_token_secret']
  config.auth_method        = :oauth
end

client = TweetStream::Client.new
client.userstream do |status|
  if status.text.include?('エアコン')
    iremocon = Iremocon.new(iremocon_config['address'])

    if status.text.include?('消して')
      iremocon.is(aircon['turn_off'].to_i)
    elsif status.text.include?('つけて')
      iremocon.is(aircon['turn_on'].to_i)
    end

    iremocon.telnet.close
  end
end

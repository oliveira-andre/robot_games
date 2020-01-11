# frozen_string_literal: true

require 'json'
require 'sinatra'

Dir['./app/services/*.rb'].each { |file| require file }

class App < Sinatra::Base
  get '/' do
    InterpretService.call
    content_type :json, charset: 'utf-8'
    { message: 'telegram is up' }.to_json
  end
end

require_relative "../lib/split-mongoid"

require 'mongoid'
require 'split'

Mongoid::Config.sessions = {default: {uri: ENV['MONGOID_URL'] || "mongodb://127.0.0.1:27017/split-mongoid", options: {safe: true}}}

class User
  include Mongoid::Document
  include Split::Mongoid
end


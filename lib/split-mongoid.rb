require "split-mongoid/version"
require 'split'
require 'mongoid'

module Split
  module Mongoid
    class Adapter
      def initialize(context)
        @mongoid_object = context
        @mongoid_object.split_tests ||= {}
      end

      def [](key)
        @mongoid_object.split_tests[key]
      end

      def []=(key, value)
        @mongoid_object.split_tests[key] = value
        @mongoid_object.save
      end

      def delete(key)
        @mongoid_object.split_tests.delete(key)
        @mongoid_object.save
      end

      def keys
        @mongoid_object.split_tests.keys
      end

      private
    end

    extend ActiveSupport::Concern
    include Split::Helper

    def is_robot?
      defined?(request) ? super : false
    end

    def ab_user
      @ab_user ||= Split::Mongoid::Adapter.new(self)
    end

    included do
      field :split_tests, type: Hash, default: {}
    end
  end
end

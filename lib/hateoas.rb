require 'net/http'
require 'uri'
require 'forwardable'
require 'nokogiri'

module Hateoas
  module MediaType
    def self.included(including_class)
      including_class.class_eval do
        def self.media_type(type)
          @media_type = type
        end

        def self.serialization(type)
        end

        def self.element(*elements)
        end

        def self.attribute(*attributes)
        end

        def self.relation(*relations)
        end

        def self.action(*actions)
          @actions = actions
        end

        def self.actions
          @actions
        end
      end
    end

    class Request
      extend Forwardable
      def_delegators :@uri, :request_uri, :hostname, :port

      def initialize(url, media_type)
        @uri = URI(url)
        @media_type = media_type
      end

      def get
        req = Net::HTTP::Get.new(request_uri)
        req['Accept'] = @media_type

        Net::HTTP.start(hostname, port) {|http| http.request(req) }.body
      end
    end

    def media_type; @media_type; end
    def data; @data; end

    def actions
      self.class.actions.select{|rel| relation_exists?(rel) }
    end

    def initialize(uri)
      @data = Nokogiri::XML(Request.new(uri, @media_type).get)
    end

    def relation_exists?(rel)
      @data.xpath("//*[@rel='#{rel}']").first
    end

    def transition(rel)
      node = @data.xpath("//*[@rel='#{rel}']").first
      return unless node
      @data = Nokogiri::XML(Request.new(node[:href], @media_type).get)
    end
  end
end

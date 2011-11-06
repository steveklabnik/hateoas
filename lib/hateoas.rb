require 'hateoas/version'
require 'open-uri'
require 'mechanize'

module Hateoas
  class << self
    attr_accessor :rel_namespace
    attr_writer :base_uri, :current_state

    def base_uri
      if ENV['HATEOAS_ENV'] == "development"
        development_base_uri || "#{@base_uri}.dev"
      else
        @base_uri
      end
    end

    def current_page
      current_state.body
    end

    def current_state
      @current_state ||= user_agent.get(base_uri)
    end

    def user_agent
      @user_agent ||= Mechanize.new
    end

  end

  module DSL
    extend self

    def click_link(rel)
      if Hateoas.rel_namespace
        rel = "/#{Hateoas.rel_namespace}/#{rel}"
      end

      Hateoas.current_state = Hateoas.user_agent.click(Hateoas.current_state.links.find{|l| l.attributes["rel"] == rel })
    end
  end
end

# frozen_string_literal: true

require 'nokogiri'
require 'url_finder/readers/base_reader'

module UrlFinder
  # Find URLs in HTML strings
  class HTMLReader < BaseReader
    # Returns the found URLs
    # @return [Array<String>] the found URLs
    def urls
      document = Nokogiri::HTML(content)
      @urls ||= document.css('a').map { |e| e['href'] }.compact
    end
  end
end

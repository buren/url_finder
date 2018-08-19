# frozen_string_literal: true

require 'nokogiri'
require 'url_finder/readers/base_reader'

module UrlFinder
  # Find URLs in HTML strings
  class HTMLReader < BaseReader
    # Returns the found URLs
    # @return [Array<String>] the found URLs
    def urls
      @urls ||= begin
        document = Nokogiri::HTML(content)
        document.css('a').map { |e| e['href'] }.compact
      end
    end
  end
end

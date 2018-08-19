# frozen_string_literal: true

require 'uri'
require 'url_finder/readers/base_reader'

module UrlFinder
  # Find URLs in strings
  class StringReader < BaseReader
    # Returns the found URLs
    # @return [Array<String>] the found URLs
    def urls
      @urls ||= URI.extract(content)
    end
  end
end

# frozen_string_literal: true

require 'csv'
require 'url_finder/readers/base_reader'

module UrlFinder
  # Find URLs in CSV string
  class CSVReader < BaseReader
    # Returns the found URLs
    # @return [Array<String>] the found URLs
    def urls
      @urls ||= CSV.parse(content).map(&:first).compact
    end
  end
end

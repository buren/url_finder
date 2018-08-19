# frozen_string_literal: true

require 'kramdown'
require 'url_finder/readers/base_reader'
require 'url_finder/readers/html_reader'

module UrlFinder
  # Find URLs in Markdown strings
  class MarkdownReader < BaseReader
    # Returns the found URLs
    # @return [Array<String>] the found URLs
    def urls
      @urls ||= begin
        html = Kramdown::Document.new(content).to_html
        HTMLReader.new(html).urls
      end
    end
  end
end

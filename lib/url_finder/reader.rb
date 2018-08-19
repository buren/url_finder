# frozen_string_literal: true

require 'url_finder/readers/html_reader'
require 'url_finder/readers/markdown_reader'
require 'url_finder/readers/sitemap_reader'
require 'url_finder/readers/string_reader'

module UrlFinder
  # Handles reader delegatation
  class Reader
    FORMAT_READERS = {
      'markdown' => MarkdownReader,
      'md' => MarkdownReader,
      'html' => HTMLReader,
      'sitemap' => SitemapReader,
      'sitemap.xml' => SitemapReader,
      'string' => StringReader,
      'txt' => StringReader,
    }.freeze

    # The raw content
    attr_reader :content

    # Instansiates reader
    def initialize(content, file_format)
      @content = content
      @file_format = file_format
    end

    # Returns the file format
    # @return [String] the file format
    def file_format
      @file_format.to_s.downcase
    end

    # Returns the appropriate reader for the given file format or raises error
    # @return [BaseReader] subclass of base reader
    def urls
      reader_klass = FORMAT_READERS.fetch(file_format) do
        raise(ArgumentError, "unknown format #{file_format}")
      end
      reader_klass.new(content)
    end
  end
end

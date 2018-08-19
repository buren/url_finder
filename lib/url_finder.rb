# frozen_string_literal: true

require 'url_finder/version'
require 'url_finder/reader'

# Gem namespace
module UrlFinder
  # Find URLs in file
  # @param [String] path to file
  # @param [String] file_format
  #   of file if nil file format will tried to be infered from
  #   file extension (markdown, html, csv, string)
  def self.from_file(path, file_format = nil)
    file_format ||= path.split('.').last

    from(File.read(path), file_format)
  end

  # Find URLs in string
  # @param [String] content string
  # @param [String] file_format of string (markdown, html, csv, string)
  def self.from(content, file_format)
    Reader.new(content, file_format).urls
  end
end

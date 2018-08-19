# frozen_string_literal: true

module UrlFinder
  # Base class for reader implementations
  class BaseReader
    # Alias for #new
    # @return [BaseReader] instance of BaseReader
    def self.urls(*args)
      new(*args)
    end

    include Enumerable

    attr_reader :content

    # Initialize reader
    # @param [String] string to find URLs in
    def initialize(content)
      @content = content
      @urls = nil
    end

    # Yield each url
    # @see Enumerable#each
    def each(&block)
      urls.each(&block)
    end

    # @raise [NotImplementedError] raises since this should be implemented in subclass
    def urls
      raise(NotImplementedError, 'subclass must implement!')
    end

    # Returns true if no URLs were found
    # @return [true, false] true if no URLs were found
    def empty?
      urls.empty?
    end

    # Returns the URLs as an array
    # @return [Array<String>] the found URLs
    def to_a
      urls
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'
require 'url_finder/readers/html_reader'

RSpec.describe UrlFinder::HTMLReader do
  describe '#urls' do
    it 'returns URLs in the HTML string' do
      content = <<~HTML
        <a href="http://example.com">example.com</a>
        <a href="https://example.com">example.com</a>
      HTML
      expected = %w[http://example.com https://example.com]
      expect(described_class.new(content).urls).to eq(expected)
    end
  end
end

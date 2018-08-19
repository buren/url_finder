# frozen_string_literal: true

require 'spec_helper'
require 'url_finder/readers/markdown_reader'

RSpec.describe UrlFinder::MarkdownReader do
  describe '#urls' do
    it 'returns URLs in the markdown string' do
      content = <<~MARKDOWN
        [example.com](http://example.com)
        [example.com](https://example.com)
      MARKDOWN
      expected = %w[http://example.com https://example.com]
      expect(described_class.new(content).urls).to eq(expected)
    end
  end
end

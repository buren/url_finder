# frozen_string_literal: true

require 'spec_helper'
require 'url_finder/readers/string_reader'

RSpec.describe UrlFinder::StringReader do
  describe '#urls' do
    it 'returns URLs in string' do
      content = <<~STRING
        http://example.com
        https://example.com
      STRING
      expected = %w[http://example.com https://example.com]
      expect(described_class.new(content).urls).to eq(expected)
    end
  end
end

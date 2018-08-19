# frozen_string_literal: true

require 'spec_helper'
require 'url_finder/readers/csv_reader'

RSpec.describe UrlFinder::CSVReader do
  describe '#urls' do
    it 'returns the first column of CSV string' do
      content = <<~CSV
        http://example.com
        https://example.com
      CSV
      expected = %w[http://example.com https://example.com]
      expect(described_class.new(content).urls).to eq(expected)
    end
  end
end

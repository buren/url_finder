# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UrlFinder::Reader do
  describe '#urls' do
    it 'returns reader for format' do
      finder = described_class.new('', 'string')
      expect(finder.urls).to be_a(UrlFinder::StringReader)
    end

    it 'raises error for unknown format' do
      finder = described_class.new('', 'watman')
      expect { finder.urls }.to raise_error(ArgumentError)
    end
  end
end

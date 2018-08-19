# frozen_string_literal: true

RSpec.describe UrlFinder do
  it 'has a version number' do
    expect(UrlFinder::VERSION).not_to be nil
  end

  describe '::from_file' do
    it 'returns URLs in file' do
      content = <<~STRING
        http://example.com
        https://example.com
      STRING
      path = FileHelper.tempfile(content)
      expected = %w[http://example.com https://example.com]
      finder = UrlFinder.from_file(path, 'string')
      expect(finder.urls).to eq(expected)
    end
  end

  describe '::from' do
    it 'returns URLs in file' do
      content = <<~STRING
        http://example.com
        https://example.com
      STRING
      expected = %w[http://example.com https://example.com]
      finder = UrlFinder.from(content, 'string')
      expect(finder.urls).to eq(expected)
    end
  end
end

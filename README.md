# UrlFinder

Find URLs in various file formats - supports markdown, HTML, CSV and regular text.

- [Usage](#usage)
- [CLI](#cli)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'url_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url_finder

## Usage

Find URLs in file, we will infer the format from the extension

```ruby
UrlFinder.from_file('README.md').each do |url|
  puts "Found: #{url}"
end
```

You can explicitly pass the format if the file lacks an extension

```ruby
UrlFinder.from_file('README', 'md').each do |url|
  puts "Found: #{url}"
end
```

Supported formats are `markdown` (aliased as `md`), `html`, `csv` and `string`.

Find URLs in string
```ruby
html = '<a href="http://example.com">example.com</a>'
UrlFinder.from(html, 'html').each do |url|
  puts "Found: #{url}"
end
```

## CLI

```
Usage: url_finder --help
        --file=/path/to/file         Input file
        --format=file_format         Input format (html, markdown, csv, string)
    -h, --help                       How to use
```

## Wish list

- Better CSV support
  + Current support is extremely crude and makes a lot of assumptions about the file..
- RDoc support

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/buren/url_finder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

#!/usr/bin/env ruby
if ARGV.count == 0
  STDERR.puts "Usage: css_to_erb.rb <file> [<file> <file>]"
  exit 1
end
ARGV.each do
  pattern = %q{url\('\.\./fonts/([^']+)'\)}
  replacement = %q{url("<%= asset_path '\1' %>")}
  puts File.read(ARGV[0]).gsub(/#{pattern}/, replacement)
end

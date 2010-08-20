#!/usr/bin/env ruby
version = '0.9.8'
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem(spec)?$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{acts_as_tree}
  s.version           = %q{#{version}}
  s.description       = %q{Use this acts_as extension if you want to model a tree structure by providing a parent association and a children
  association.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{acts_as_tree plugin.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ["David Heinemeier Hansson", "Philip Arndt", "Others"]
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

File.open(File.expand_path("../../refinerycms-acts_as_tree.gemspec", __FILE__), 'w').puts(gemspec)
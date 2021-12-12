# frozen_string_literal: true

require_relative 'lib/ipgeobase/version'

Gem::Specification.new do |spec|
  spec.name          = 'ipgeobase'
  spec.version       = Ipgeobase::VERSION
  spec.authors       = ['Kirill Ilyin']
  spec.email         = ['cuurjol@gmail.com']

  spec.summary       = 'Gem for receiving metadata by IP (country, city, coordinates etc.).'
  spec.description   = <<~DESCRIPTION_MESSAGE
    The ip-api.com service, which makes a request with an IP address parameter
    and receives all information about it.
  DESCRIPTION_MESSAGE
  spec.homepage = 'https://github.com/cuurjol/ipgeobase'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/cuurjol/ipgeobase'
  }
end

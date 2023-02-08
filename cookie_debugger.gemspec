# frozen_string_literal: true

require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name = 'cookie_debugger'
  spec.version = ::CookieDebugger::VERSION
  spec.authors = ['Kamil Dzierbicki']
  spec.email = ['dzierbicki.kamil@outlook.com']

  spec.summary = 'Debug Cookie overflow in easy way'
  spec.description = 'Debug Cookie overflow in easy way'
  spec.homepage = 'https://blog.oxyconit.com/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Oxyconit/cookie_debugger'
  spec.metadata['changelog_uri'] = 'https://github.com/Oxyconit/cookie_debugger'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

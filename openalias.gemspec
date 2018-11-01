# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "openalias"
  spec.version       = "0.1.0"
  spec.authors       = ["bumi"]
  spec.email         = ["hello@michaelbumann.com"]

  spec.summary       = %q{OpenAlias lookup and parsing for ruby}
  spec.description   = %q{Wrapper around the OpenAlias rust implementation that allows to lookup and parse OpenAlias entries. (Though we should write this in pure ruby - please help)}
  spec.homepage      = "https://github.com/bumi/openalias-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions << 'ext/Rakefile'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'thermite', '~> 0'
end

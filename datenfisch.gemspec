# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datenfisch/version'

Gem::Specification.new do |spec|
  spec.name          = "datenfisch"
  spec.version       = Datenfisch::VERSION
  spec.authors       = ["Ilion Beyst"]
  spec.email         = ["ilion.beyst@gmail.com"]

  spec.summary       = %q{Relational algebra combinators}
  spec.homepage      = "http://github.com/iasoon/datenfisch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

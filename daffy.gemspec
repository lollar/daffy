# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "daffy/version"

Gem::Specification.new do |spec|
  spec.name          = "daffy"
  spec.version       = Daffy::VERSION
  spec.authors       = ["lollar"]
  spec.email         = ["mike@lollar.codes"]

  spec.summary       = "Built-in Null Objects that mock ActiveRecord instances"
  spec.description   = "Built-in Null Objects that mock ActiveRecord instances"
  spec.homepage      = "https://github.com/lollar/daffy"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"]    = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/lollar/daffy"
    spec.metadata["changelog_uri"]   = "https://github.com/lollar/daffy/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

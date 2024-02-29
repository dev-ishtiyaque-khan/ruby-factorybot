# frozen_string_literal: true

require_relative "lib/factory_clone/version"

Gem::Specification.new do |spec|
  spec.name          = "factory_clone"
  spec.version       = FactoryClone::VERSION
  spec.authors       = ["Ishtiyaque Khan"]
  spec.email         = ["ishtiyaquekhan141@gmail.com"]

  spec.summary       = "Build factory functionality to build instances of classes in plain ruby"
  spec.description   = "We have created basic factory functionality to create instances of classes with different attribute values in ruby."
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end

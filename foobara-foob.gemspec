require_relative "src/version"

Gem::Specification.new do |spec|
  spec.name = "foobara-foob"
  spec.version = Foobara::Foob::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "foob: cli interface for code generators and whatnot for Foobara projects"
  spec.homepage = "https://github.com/foobara/foob"

  # Equivalent to SPDX License Expression: Apache-2.0 OR MIT
  spec.license = "Apache-2.0 OR MIT"
  spec.licenses = ["Apache-2.0", "MIT"]

  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir[
    "bin/foob",
    "lib/**/*",
    "src/**/*",
    "LICENSE.txt"
  ]

  spec.bindir = "bin"
  spec.executables = ["foob"]

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end

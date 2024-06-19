require_relative "version"

Gem::Specification.new do |spec|
  spec.name = "foob"
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
    "version.rb",
    "LICENSE*.txt",
    "README.md",
    "CHANGELOG.md"
  ]

  spec.bindir = "bin"
  spec.executables = ["foob"]

  spec.add_dependency "foobara"
  spec.add_dependency "foobara-autocrud-generator"
  spec.add_dependency "foobara-command-generator"
  spec.add_dependency "foobara-domain-generator"
  spec.add_dependency "foobara-domain-mapper-generator"
  spec.add_dependency "foobara-empty-ruby-project-generator"
  spec.add_dependency "foobara-empty-typescript-react-project-generator"
  spec.add_dependency "foobara-organization-generator"
  spec.add_dependency "foobara-rack-connector-generator"
  spec.add_dependency "foobara-redis-crud-driver-generator"
  spec.add_dependency "foobara-remote-imports-generator"
  spec.add_dependency "foobara-resque-connector-generator"
  spec.add_dependency "foobara-resque-scheduler-connector-generator"
  spec.add_dependency "foobara-sh-cli-connector"
  spec.add_dependency "foobara-sh-cli-connector-generator"
  spec.add_dependency "foobara-type-generator"
  spec.add_dependency "foobara-typescript-react-command-form-generator"
  spec.add_dependency "foobara-typescript-remote-command-generator"

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end

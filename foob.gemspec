require_relative "version"

local_ruby_version = File.read("#{__dir__}/.ruby-version").chomp
local_ruby_version_minor = local_ruby_version[/\A(\d+\.\d+)\.\d+\z/, 1]
minimum_ruby_version = "#{local_ruby_version_minor}.0"

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

  spec.required_ruby_version = ">= #{minimum_ruby_version}"

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

  spec.add_dependency "foobara", "~> 0.0.116"
  spec.add_dependency "foobara-command-generator", "~> 0.0.1"
  spec.add_dependency "foobara-domain-generator", "~> 0.0.1"
  spec.add_dependency "foobara-domain-mapper-generator", "~> 0.0.1"
  spec.add_dependency "foobara-empty-ruby-project-generator", "~> 0.0.1"
  spec.add_dependency "foobara-empty-typescript-react-project-generator", "~> 0.0.1"
  spec.add_dependency "foobara-local-files-crud-driver-generator", "~> 0.0.1"
  spec.add_dependency "foobara-mcp-connector-generator", "~> 0.0.1"
  spec.add_dependency "foobara-organization-generator", "~> 0.0.1"
  spec.add_dependency "foobara-rack-connector-generator", "~> 0.0.1"
  spec.add_dependency "foobara-redis-crud-driver-generator", "~> 0.0.1"
  spec.add_dependency "foobara-remote-imports-generator", "~> 0.0.1"
  spec.add_dependency "foobara-resque-connector-generator", "~> 0.0.1"
  spec.add_dependency "foobara-resque-scheduler-connector-generator", "~> 0.0.1"
  spec.add_dependency "foobara-sh-cli-connector", "~> 0.0.10"
  spec.add_dependency "foobara-sh-cli-connector-generator", "~> 0.0.1"
  spec.add_dependency "foobara-type-generator", "~> 0.0.1"
  spec.add_dependency "foobara-typescript-react-command-form-generator", "~> 0.0.1"
  spec.add_dependency "foobara-typescript-remote-command-generator", "~> 0.0.1"

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end

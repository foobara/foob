source "https://rubygems.org"
ruby File.read("#{__dir__}/.ruby-version")

gemspec

# TODO: move this to .gemspec
gem "foobara", git: "foobara", branch: "main"
gem "foobara-util", github: "foobara/util"
# If uncommenting the following for local development, you need to run: bundle config set local.foobara-util ../util
# gem "foobara-util", path: "../util"
gem "foobara-sh-cli-connector", github: "foobara/sh-cli-connector"
# gem "foobara-sh-cli-connector", path: "../sh-cli-connector"

gem "rake"

group :development do
  gem "foobara-command-generator", github: "foobara/command-generator"
  gem "foobara-empty-ruby-project-generator", github: "foobara/empty-ruby-project-generator"
  # gem "foobara-empty-ruby-project-generator", path: "../empty-ruby-project-generator"
  # TODO: this should be a dependency of the above
  gem "foobara-files-generator", github: "foobara/files-generator"
  gem "foobara-rubocop-rules", github: "foobara/rubocop-rules"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
end

group :test do
  gem "foobara-spec-helpers", github: "foobara/spec-helpers"
  gem "rspec"
  gem "rspec-its"
  gem "simplecov"
end

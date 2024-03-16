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
  gem "foobara-domain-generator", github: "foobara/domain-generator"
  gem "foobara-empty-ruby-project-generator", github: "foobara/empty-ruby-project-generator"
  # gem "foobara-empty-ruby-project-generator", path: "../empty-ruby-project-generator"
  # TODO: this should be a dependency of the above
  gem "foobara-files-generator", github: "foobara/files-generator"
  # gem "foobara-files-generator", path: "../files-generator"
  gem "foobara-organization-generator", github: "foobara/organization-generator"
  gem "foobara-rack-connector-generator", github: "foobara/rack-connector-generator"
  gem "foobara-redis-crud-driver-generator", github: "foobara/redis-crud-driver-generator"
  gem "foobara-resque-connector-generator", github: "foobara/resque-connector-generator"
  gem "foobara-resque-scheduler-connector-generator", github: "foobara/resque-scheduler-connector-generator"
  gem "foobara-rubocop-rules", github: "foobara/rubocop-rules"
  gem "foobara-sh-cli-connector-generator", github: "foobara/sh-cli-connector-generator"
  gem "foobara-type-generator", github: "foobara/type-generator"
  gem "foobara-typescript-react-command-form-generator", github: "foobara/typescript-react-command-form-generator"
  gem "foobara-typescript-remote-command-generator", github: "foobara/typescript-remote-command-generator"
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

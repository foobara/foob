source "https://rubygems.org"
ruby File.read("#{__dir__}/.ruby-version")

gemspec

# gem "foobara-util", path: "../util"
# gem "foobara", path: "../foobara"
# gem "foobara-sh-cli-connector", path: "../sh-cli-connector"

gem "rake"

group :development do
  # gem "foobara-empty-typescript-react-project-generator", path: "../empty-typescript-react-project-generator"
  gem "foobara-rubocop-rules"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  # TODO: Just adding this to suppress warnings seemingly coming from pry-byebug. Can probably remove this once
  # pry-byebug has irb as a gem dependency
  gem "irb"
end

group :test do
  gem "foobara-spec-helpers"
  gem "rspec"
  gem "rspec-its"
  gem "simplecov"
end

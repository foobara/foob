# foob

`foob` is a CLI interface for running code generators for Foobara projects.

## Installation

Install `foob` as a standalone gem in the terminal:

```
gem install foob
```

Or add it to your existing application's Gemfile either directly or with bundle:

```
bundle add foob --group development
```

## Usage

`foob` is invoked in your terminal with the following general syntax:

`foob [GLOBAL_OPTIONS] [ACTION] [ACTION_ARGUMENTS]`

The main generator workflow is:

- `foob generate`: Prints the available generators in its usage output.
- `foob help [GENERATOR]`: Shows the inputs for a generator. For example, `foob help ruby-project` shows the inputs for the `ruby-project` generator.
- `foob generate [GENERATOR] [GENERATOR_INPUTS]`: Runs the selected generator.

For an exhaustive list of available actions, run `foob --help` in your terminal. Each action performs a specific function as described below:
- `generate [GENERATOR] [GENERATOR_INPUTS]`: Runs a generator that writes files to disk. With no generator name, it prints usage and the available generator list.
- `version` or `-v` OR `--version`: Prints out the version of `foob` installed on your machine
- `help [TARGET]`: Prints help for an action, registered command or type, or generator.
- `console`: Opens an interactive console. NOTE: This only works when run from inside a Foobara project directory that has a `./bin/console` script.

### The `generate` action

`foob generate` can quickly generate and wire-up various types of helpful Foobara code.

To see the inputs available for a generator, run `foob help [GENERATOR]`.
For example, run `foob help ruby-project` to see the inputs for the `ruby-project` generator.

You can see all the available generators with `foob g` and nothing else:

```
$ foob g
Usage: foob generate [GENERATOR_KEY] [GENERATOR_OPTIONS]

Available Generators:

  command
  domain
  domain-mapper
  foobify-rails-app
  local-files-crud-driver
  mcp-connector
  organization
  rack-connector
  redis-crud-driver
  remote-imports
  resque-connector
  resque-scheduler-connector
  ruby-project
  sh-cli-connector
  type
  typescript-react-command-form
  typescript-react-project
  typescript-remote-commands
```

## Contributing

Contributions in the form of PRs and issues are always welcome at https://github.com/foobara/foob
You need a working Ruby installation to run the tests.

To work on an existing issue or submit a PR:

1. Fork the `foob` repository and clone it to your local machine
2. Run `bundle install` to install any dependencies
3. Run `rake` to ensure that everything works as expected before making any changes
4. Implement your changes
5. Re-run `rake` to ensure that all tests and RuboCop still pass
6. Commit, push to GitHub, and open a PR to review

## License

foob is licensed under your choice of the Apache License 2.0 or the MIT license.
See [LICENSE.txt](LICENSE.txt) for more info about licensing.

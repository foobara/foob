# foob

`foob` is a CLI interface for running code generators for Foobara projects. 

## Installation

Install `foob` as a standalone gem in the terminal:

    `$ gem install foob`

OR add it to your existing application's Gemfile:

    `$ bundle add foob`

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
- `manifest`: Returns the Foobara system manifest.
- `console`: Opens an interactive console. NOTE: This only works when run from inside a Foobara project directory that has a `./bin/console` script. 
- `run [COMMAND]` and `describe [COMMAND_OR_TYPE]`: Foobara actions for running a registered command or describing a registered command or type. The standalone `foob` CLI does not register application commands or types by default.
- `ping` and `query_git_commit_info`: These actions are listed on running `foob --help` but require a connected Foobara app to function. Running them in a standalone context in the terminal returns `Could not find command registered for ping/query_git_commit_info` as the output.

### The `generate` action
`generate` is the primary action of the `foob` gem. It allows you to run generators that write specific files to disk.

The `generate` action has 18 generators, each with specific inputs depending on what you are generating. To see the inputs available for a generator, run `foob help [GENERATOR]`. For example, run `foob help ruby-project` to see the inputs for the `ruby-project` generator. 

The table below lists the 18 generators associated with the `generate` action. 

| Generator | What it generates |
| --- | --- |
| `command` | Foobara command code |
| `domain` | A Foobara domain |
| `domain-mapper` | A domain mapper |
| `foobify-rails-app` | Foobara integration files for a Rails app |
| `local-files-crud-driver` | A local-files CRUD driver |
| `mcp-connector` | An MCP connector |
| `organization` | A Foobara organization |
| `rack-connector` | A Rack connector |
| `redis-crud-driver` | A Redis CRUD driver |
| `remote-imports` | Remote-import configuration or files |
| `resque-connector` | A Resque connector |
| `resque-scheduler-connector` | A Resque Scheduler connector |
| `ruby-project` | A Ruby project scaffold |
| `sh-cli-connector` | A shell CLI connector |
| `type` | Foobara type code |
| `typescript-react-command-form` | A React command form |
| `typescript-react-project` | A TypeScript React project scaffold |
| `typescript-remote-commands` | TypeScript code for remote commands |

## Contributing

Contributions in the form of  PRs and issues are always welcome. 

Before you get started, ensure you have Ruby installed(via RVM or a similar version manager).

To work on an existing issue or submit a PR:
1. Fork the `foob` repository and clone it to your local machine. 
2. Run `bundle install` to install any dependencies
3. Run `rake` to ensure that everything works as expected before making any changes. 
4. Implement your changes adding tests where applicable
5. Re-run `rake` to ensure that all tests and RuboCop still pass. 
6. Commit, push to GitHub and open a PR to review

## License

foob is licensed under your choice of the Apache License 2.0 or the MIT license.
See [LICENSE.txt](LICENSE.txt) for more info about licensing.

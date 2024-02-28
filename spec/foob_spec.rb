RSpec.describe Foobara::CommandConnectors::Foob do
  let(:argv) do
    [
      "g",
      "empty-ruby-project",
      "-f",
      full_project_name,
      "--output_directory",
      output_directory,
      "--description",
      description
    ]
  end
  let(:full_project_name) { "Some::Test::Project" }
  let(:output_directory) { "#{__dir__}/../../fake_project_generated_from_test_suite" }
  let(:description) { "some fake project generated from the test suite." }
  let(:foob) { described_class.new(program_name: "foob") }
  let(:response) { foob.run(argv, exit: false) }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(
      Foobara::Generators::EmptyRubyProjectGenerator::WriteEmptyRubyProjectToDisk
    ).to receive(:push_to_github).and_return(nil)
    # rubocop:enable RSpec/AnyInstance

    FileUtils.rm_rf output_directory
  end

  it "can generate thing" do
    expect(response.status).to be(0)

    gemspec_contents = File.read("#{output_directory}/some-test-project.gemspec")

    expect(gemspec_contents).to match(/spec.name = "some-test-project"/)
  end

  context "when calling without inputs" do
    let(:argv) { [] }

    it "gives help output" do
      expect(response.status).to be(0)

      expect(response.request.action).to eq("help")
    end
  end

  context "when giving g but nothing else" do
    let(:argv) { ["g"] }

    it "gives help output" do
      expect(response.status).to_not be(0)

      expect(response.body).to include("Usage: foob generate")
    end
  end

  context "when generator key is bad" do
    let(:argv) { %w[g bad-key] }

    it "gives relevant error" do
      expect(response.status).to_not be(0)

      expect(response.body).to include("Generator not found: bad-key")
    end
  end

  context "when generator key is correct but not arguments" do
    let(:argv) { %w[generate empty-ruby-project] }

    it "gives relevant error" do
      expect(response.status).to_not be(0)

      expect(response.body).to include("Missing required attribute")
    end
  end
end

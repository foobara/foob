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
  let(:foob) { described_class.new }
  let(:response) { foob.run(argv, exit: false) }

  it "can generate thing" do
    expect(response).to eq("asdf")

    expect(result.keys).to include(".github/workflows/ci.yml")
    expect(result.keys).to include("lib/some_namespace/some_other_namespace/final_thingy.rb")
    expect(File).to exist("#{output_directory}/foobara-generated.json")
  end
end

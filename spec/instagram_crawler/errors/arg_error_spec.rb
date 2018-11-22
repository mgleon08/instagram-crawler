RSpec.describe InstagramCrawler::Errors::ArgError do
  subject(:arg_error) { described_class.new('-u') }
  it '#initialize' do
    error_message = arg_error.to_s
    expect(error_message).to eq("Missing argument: -u")
  end
end

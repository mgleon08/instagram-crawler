RSpec.describe InstagramCrawler::Errors::HttpError do
  subject(:http_error) { described_class.new("http fail") }
  it '#initialize' do
    error_message = http_error.to_s
    expect(error_message).to eq("HttpError: http fail")
  end
end

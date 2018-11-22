RSpec.describe InstagramCrawler::Errors::EnvError do
  subject(:env_error) { described_class.new }
  it '#initialize' do
    error_message = env_error.to_s
    expect(error_message).to eq("Undefined env variable sessionid\nYou should setting env variable 'export sessionid=[your instagram sessionid]' and execute again.")
  end
end

RSpec.describe InstagramCrawler::MultiIO do
  subject(:multi_io) { described_class.new(*[STDOUT]) }

  it '#pretty_file_text' do
    text = "\e[0;96;49m[2016-12-12 12:12]\e[0m leon: 123\n"
    pretty_text = multi_io.send(:pretty_file_text, text)
    expect(pretty_text).to eq("[2016-12-12 12:12] leon: 123\n")
  end
end

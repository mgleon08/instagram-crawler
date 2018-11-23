RSpec.describe InstagramCrawler::Config do
  subject(:config) { described_class }

  it '#defaule_url' do
    expect(config.default_url).to eq("https://www.instagram.com")
  end

  it '#user_name=' do
    config.user_name = "marvel"
    expect(config.user_name).to eq("marvel")
    expect(config.base_url).to eq("#{config.default_url}/marvel/")
    expect(config.base_path).to eq("./instagram-crawler/marvel")
    expect(config.log_path).to eq("./instagram-crawler/marvel/log_file")
  end

  it 'after_date=' do
    config.after_date=("20181110")
    expect(config.after_date).to eq("20181110")
    expect(config.parse_date).to eq(1541779200)
  end
end

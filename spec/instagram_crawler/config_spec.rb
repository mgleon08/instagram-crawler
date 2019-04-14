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
    expect(config.parse_after_date).to eq(Time.parse("20181110").to_i)
  end

   it 'before_date=' do
    config.before_date=("20181110")
    expect(config.before_date).to eq("20181110")
    expect(config.parse_before_date).to eq(Time.parse("20181110").to_i)
  end
end

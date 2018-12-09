RSpec.describe InstagramCrawler::Parser::Args do
  subject(:args) { described_class }
  subject(:config) { InstagramCrawler::Config }

  context 'when type arguments' do
    it 'should get right with short args' do
      parsms = ['-u', 'marvel', '-a', '20180101', '-d', '-l', '-p', 'http://example.com']

      arg = args.new(parsms)
      expect(config.user_name).to eq 'marvel'
      expect(config.download).to eq true
      expect(config.after_date).to eq '20180101'
      expect(arg.log).to eq true
      expect(config.proxy).to eq 'http://example.com'
    end

    it 'should get right with long args' do
      parsms = ['--username', 'marvel', '--after', '20180101', '--download', '--log', '--proxy', 'http://example.com']
      arg = args.new(parsms)
      expect(config.user_name).to eq 'marvel'
      expect(config.download).to eq true
      expect(config.after_date).to eq '20180101'
      expect(arg.log).to eq true
      expect(config.proxy).to eq 'http://example.com'
    end
  end
end

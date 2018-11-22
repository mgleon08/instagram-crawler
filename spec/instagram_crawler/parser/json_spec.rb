RSpec.describe InstagramCrawler::Parser::Json do
  subject(:json) { described_class }
  path = "spec/instagram_crawler/fixtures"
  let(:api_path)  { File.read(Pathname("#{path}/marvel_api.json").realpath) }

   it '#parsing' do
    allow_any_instance_of(json).to receive(:get_json).and_return(api_path)
    allow_any_instance_of(json).to receive(:loop_edges)
    user_id = "204633036"
    page_info = {
      "has_next_page"=>true,
      "end_cursor"=>"QVFDaUNHSDhkb052alJvcTRGdGpMR1ZBNFpaVjZybFB1SVZrTVprQldDalBkY3VVVnBvaWNsd1Bpei16WlJJd19NUll1U191SUdJRjJDUUdUSU5OemYwRA=="
    }
    expect(json.new(page_info, user_id).parsing).to eq(nil)
  end
end

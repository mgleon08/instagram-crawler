RSpec.describe InstagramCrawler::Parser::Html do
  subject(:html) { described_class }
  path = "spec/instagram_crawler/fixtures"
  let(:home_path)  { File.read(Pathname("#{path}/marvel_home.html").realpath) }
  let(:post_path)  { File.read(Pathname("#{path}/marvel_post.html").realpath) }
  let(:photo_path) { File.read(Pathname("#{path}/marvel_photo.html").realpath) }
  let(:video_path) { File.read(Pathname("#{path}/marvel_video.html").realpath) }

  it '#parsing' do
    allow_any_instance_of(html).to receive(:get_html).and_return(home_path)
    allow_any_instance_of(html).to receive(:loop_edges)
    page_info, user_id = html.new('instagram').parsing
    expect(page_info["has_next_page"]).to eq(true)
    expect(page_info["end_cursor"]).to eq("QVFDaUNHSDhkb052alJvcTRGdGpMR1ZBNFpaVjZybFB1SVZrTVprQldDalBkY3VVVnBvaWNsd1Bpei16WlJJd19NUll1U191SUdJRjJDUUdUSU5OemYwRA==")
    expect(user_id).to eq("204633036")
  end

  it '#parsing_video_page' do
    allow_any_instance_of(html).to receive(:get_html).and_return(video_path)
    url = html.new('instagram').parsing_video_page
    expect(url).to eq("https://instagram.ftpe8-4.fna.fbcdn.net/vp/5cfcf4ff4d73c0ea7e37d5484c072e7d/5BF72A14/t50.2886-16/46067461_356140375142721_4906834749374332928_n.mp4")
  end

  context '#parsing_photo_page' do
    it 'with photo page' do
      allow_any_instance_of(html).to receive(:get_html).and_return(photo_path)
      url = html.new('instagram').parsing_photo_page
      expect(url.class).to eq(String)
    end

    it 'with post page' do
      allow_any_instance_of(html).to receive(:get_html).and_return(post_path)
      url = html.new('instagram').parsing_photo_page
      expect(url.class).to eq(Array)
    end
  end
end

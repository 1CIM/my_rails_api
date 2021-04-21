RSpec.describe 'GET /api/artices' do
  describe 'successfully' do
    let!(:article_1) {create(:article, title: 'älgsonden har ollat månen')}
    let!(:articles_2_3) {2.times{create(:article)}}
    before do
      get '/api/articles'
    end

    it 'is expected to respond with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expeted to return all articles' do
      expect(response_json['articles'].count).to eq 3
    end

    it 'is expected to return articles titles' do
      expect(response_json['articles'].first['title']).to eq 'älgsonden har ollat månen'
    end
  end
end
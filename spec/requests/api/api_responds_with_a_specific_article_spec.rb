RSpec.describe 'GET /api/articles/:id', type: :request do
  describe 'successfully' do
    let!(:article) { create(:article, title: 'Skoj med älgsond!', body: 'Här ollar älgsonden pluto') }
    
    before do 
      get "/api/articles/#{article.id}"
    end
    
    it 'is expected to respond with 200' do
      expect(response).to have_http_status 200
    end
    
    it 'is expected to return the requested articles title' do
      expect(response_json['article']['title']).to eq 'Skoj med älgsond!'
    end
    
    it 'is expected to return the requested articles body' do
      expect(response_json['article']['body']).to eq 'Här ollar älgsonden pluto'
    end
  end
end

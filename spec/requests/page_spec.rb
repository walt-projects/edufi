require 'rails_helper'

RSpec.describe 'Page Requests', type: :request do
  describe 'GET /' do
    it 'returns a successful response' do
      get root_url

      expect(response).to be_successful
    end
  end
end

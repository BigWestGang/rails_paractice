require 'rails_helper'

RSpec.describe "Indexes", type: :request do
  describe "GET /" do
    let(:json) { JSON.parse(response.body) }
    let(:expected_response_properties) do
      {
        'message' => 'Hello, World'
      }
    end
    before do
      get '/'
    end
    it "is response successfully" do
      expect(response).to be_successful
    end
    it "is response status 200" do
      expect(response).to have_http_status "200"
    end
    it "is response body is {message: 'Hello, World'}" do
      expect(json).to match(expected_response_properties)
    end
  end
end

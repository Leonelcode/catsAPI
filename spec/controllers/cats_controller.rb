require 'rails_helper'

RSpec.describe CatsController, type: :controller do

  before(:each) do
    @access_token = FactoryBot.create(:api_key).access_token
    http_login(@access_token)
  end

  let(:breed) { FactoryBot.create(:breed) }
  let!(:cat) { FactoryBot.create(:cat) }
  let(:cat_id) { cat.id }

  # Test suite for GET /cats (index)
  describe 'GET /cats' do

    before do
      get :index, format: 'json'
    end

    it 'returns cats' do
      expect(json['data'].first['attributes']).not_to be_empty
      expect(json['data'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suit for GET /cats/:id (show)
  describe 'GET /cat/:id' do
    before do
      get :show, params: { id: cat_id }
    end

    context 'when the record exists' do
      it 'returns the cat' do
        expect(json['data']).not_to be_empty
        expect(json['data']['id'].to_i).to eq(cat_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:cat_id) { 666 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find cat/)
      end
    end
  end

  # Test suit for POST /cats (create)
  describe 'POST /cats' do

    # valid cat
    let(:valid_attributes) do
      { name: 'Boris', description: 'just a fantastic cat', image_url: 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg', breed_id: breed.id }
    end

    context 'when the request is valid' do
      before do
        post :create, params: { cat: valid_attributes }
      end

      it 'creates a cat' do
        expect(json['data']['attributes']['name']).to eq('Boris')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      let(:invalid_attributes) do
        { name: 'incomplete cat' }
      end

      before do
        post :create, params: { cat: invalid_attributes }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        errors = JSON.parse(response.body)
        expect(errors['message']).to match(/Validation failed/)
      end
    end
  end

  # Test suite for PUT /cats/:id
  describe 'PUT /cats/:id' do

    # valid cat
    let(:valid_attributes) do
      { name: 'Boris', description: 'just a cat', image_url: 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg', breed_id: '2' }
    end

    context 'when the record exists' do
      before do
        put :update, params: { id: cat_id, cat: valid_attributes }
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /cats/:id
  describe 'DELETE /cats/:id' do
    before do
      delete :destroy, params: { id: cat_id}
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
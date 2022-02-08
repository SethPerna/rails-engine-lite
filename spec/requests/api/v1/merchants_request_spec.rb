require 'rails_helper'
RSpec.describe 'merchants API' do
  it 'returns all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].count).to eq(3)

    merchants[:data].each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a(String)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end
end

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

  it 'returns one merchant' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(merchant[:data]).to have_key(:id)
    expect(merchant[:data][:id]).to be_a(String)
    expect(merchant[:data][:attributes]).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)
  end

  it 'returns 404 if invalid id' do

    get "/api/v1/merchants/999999999"

    expect(response.status).to eq(404)
  end

  it 'get all items for specific merchant' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    items_1 = create_list(:item, 3, merchant_id: merchant_1.id)
    items_2 = create_list(:item, 4, merchant_id: merchant_2.id)
    get "/api/v1/merchants/#{merchant_1.id}/items"

    merchant_1_json = JSON.parse(response.body, symbolize_names: true)
    item = merchant_1_json[:data].first[:attributes]
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item[:merchant_id]).to eq(merchant_1.id)

  end

  it 'find one merchant based on search criteria' do
    merchant_1 = Merchant.create!(name: "Williams and Son")
    merchant_2 = Merchant.create!(name: "Ted Turner")

    get "/api/v1/merchants/find?name=Williams"

    merchant = JSON.parse(response.body, symbolize_names: true)
    response_data = merchant[:data][:attributes][:name]

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response_data).to eq(merchant_1.name)
  end

  it 'returns message when no merchant is found' do
    merchant_1 = Merchant.create!(name: "Williams and Son")
    merchant_2 = Merchant.create!(name: "Ted Turner")

    get "/api/v1/merchants/find?name=Seth"

    merchant = JSON.parse(response.body, symbolize_names: true)
    response_data = merchant[:data][:messgae]

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response_data).to_not eq("Merchant not found")
  end
end

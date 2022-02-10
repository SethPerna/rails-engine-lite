require 'rails_helper'
RSpec.describe 'Items API' do
  it 'returns all items' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].count).to eq(3)

    items[:data].each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_a(String)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)
    end
  end

  it 'returns one item' do
    merchant = create(:merchant)
    id = create(:item, merchant_id: merchant.id).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(item[:data]).to have_key(:id)
    expect(item[:data][:id]).to be_an(String)

    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_an(String)

    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes][:description]).to be_an(String)

    expect(item[:data][:attributes]).to have_key(:unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_an(Float)

    expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to be_an(Integer)
  end

  it 'create one item' do
    merchant = create(:merchant)
    item_params = ({
      name: 'Stout',
      description: 'dark notes with rich oatmeal flavor',
      unit_price: 7.5,
      merchant_id: merchant.id
    })

    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end

  it 'returns status 404 if invalide attributes are provided' do
    merchant = create(:merchant)
    item_params = ({
      name: 'Stout',
      description: 'dark notes with rich oatmeal flavor',
      unit_price: 7.5,
      merchant_id: 999999999
    })

    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

    expect(response.status).to eq(404)
  end

  it 'returns status 404 if invalide attributes are provided' do
    merchant = create(:merchant)
    item_params = ({
      description: 'dark notes with rich oatmeal flavor',
      unit_price: 7.5,
      merchant_id: merchant.id
    })

    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

    expect(response.status).to eq(404)
  end

  it 'edit an item' do
    merchant = create(:merchant)
    id = create(:item, merchant_id: merchant.id).id

    previous_name = Item.last.name
    item_params = { name: 'IPA', merchant_id: "#{merchant.id}" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate(item: item_params)
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("IPA")
  end

  it 'delete an item' do
    merchant = create(:merchant)
    id = create(:item, merchant_id: merchant.id).id

    expect(Item.count).to eq(1)
    delete "/api/v1/items/#{id}"

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
    expect{Item.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'get a merchant data from an item id' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item = create(:item, merchant_id: merchant_1.id)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(merchant[:data][:id].to_i).to eq(merchant_1.id)
    expect(merchant[:data][:attributes][:name]).to eq(merchant_1.name)
    expect(item.merchant_id).to eq(merchant[:data][:id].to_i)
  end

  it 'find all items based on search criteria' do
    merchant = Merchant.create!(name: "Ted Turner")
    item_1 = Item.create!(name: "Russian Imperial Stout", description: "Malty Oatmeal Whiskey", unit_price: 10.5, merchant_id: merchant.id)
    item_2 = Item.create!(name: "Milk Stout", description: "Smooth & Malty", unit_price: 5.5, merchant_id: merchant.id)
    item_3 = Item.create!(name: "Hazy Ipa", description: "Smooth & Hoppy", unit_price: 6.5, merchant_id: merchant.id)
    item_4 = Item.create!(name: "Irish Red", description: "Malty RED", unit_price: 4.5, merchant_id: merchant.id)

    get "/api/v1/items/find_all?name=Stout"

    items = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    items[:data].each do |item|
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a(Float)
      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_a(Integer)
      expect(item[:attributes][:name]).to_not eq(item_3.name)
      expect(item[:attributes][:name]).to_not eq(item_4.name)
    end
  end
end

require 'faraday'
require 'rspec'
require 'nokogiri'
require_relative '../lib/test_data'
conn = Faraday.new(:url => 'http://www.zillow.com/webservice/')
response = conn.get 'GetDeepSearchResults.htm',
                    {:'zws-id' => 'X1-ZWz1gdr6wmx3bf_a80zd',
                     :'address' => '12582-Cardinal-Avenue',
                     :'citystatezip' => '92843'}


context 'when result returns' do
  it 'check status' do
    expect(response.status).to eq(200)
  end

  it 'check address details' do
    doc = Nokogiri::XML response.body
    expect(doc.xpath('//street').collect{|street| street.text}).to eq([test_address.address[:street]])
    expect(doc.xpath('//city').collect{|city| city.text}).to eq([test_address.address[:city]])
    expect(doc.xpath('//zipcode').collect{|zipcode| zipcode.text}).to eq([test_address.address[:zip]])
    expect(doc.xpath('//bedrooms').collect{|bedrooms| bedrooms.text}).to eq([test_address.address[:bedrooms]])
    expect(doc.xpath('//bathrooms').collect{|bathrooms| bathrooms.text}).to eq([test_address.address[:bathrooms]])
    expect(doc.xpath('//finishedSqFt').collect{|finishedSqFt| finishedSqFt.text}).to eq([test_address.address[:sqft]])
    expect(doc.xpath('//lotSizeSqFt').collect{|lotSizeSqFt| lotSizeSqFt.text}).to eq([test_address.address[:lot_size]])
  end
end
require 'faraday'
require 'rspec'
require 'nokogiri'
response = Faraday.get('http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1gdr6wmx3bf_a80zd&address=12582-Cardinal-Avenue&citystatezip=92843')

context 'when result returns' do
  it 'check status' do
    expect(response.status).to eq(200)
  end

  it 'check address' do
    doc = Nokogiri::XML response.body
    expect(doc.xpath('//bedrooms').collect{|bedrooms| bedrooms.text}).to eq(['4'])
    expect(doc.xpath('//street').collect{|street| street.text}).to eq(['12582 Cardinal Ave'])
  end
end
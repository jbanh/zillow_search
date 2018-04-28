Faraday.get do |req|
  req.url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?"
  req.params['zwsid'] = ''
  req.params['address'] = ''
  req.params['citystatezip'] = ''
end
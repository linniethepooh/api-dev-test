require 'open-uri'
require 'json'

class ParseDriftrock

  def initialize(collection)
    @collection = collection
  end

  def request(collection)
    response = open("https://driftrock-dev-test.herokuapp.com/#{@collection}")
    data_hash = JSON.parse(response.read)
    results = data_hash["data"]
    return results
  end
end

module LocationApp
  class Country < APIResource
    extend LocationApp::APIOperations::List

    def self.find_using_code(code)
      url = File.join(resource_url, code)
      result = get(url)
      raise "Not found" if result.blank?
      new(result['data'])
    end

    def cities
      url = File.join(self.class.resource_url, code, "cities")
      results = self.class.get(url)['data']
      results.map do |result|
        City.new(result)
      end
    end

    def code
      attributes['code']
    end

  end
end

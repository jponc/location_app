module LocationApp
  class City < APIResource
    extend LocationApp::APIOperations::List

    def self.find_using_ip(ip)
      url = File.join(resource_url, "from_ip?ip=#{ip}")
      result = get(url)
      raise "Not found" if result['status'] == 404
      new(result)
    end

    def self.autocomplete(query)
      url = File.join(resource_url, "autocomplete?query=#{query}")
      list(url)
    end

    def computed_multiplier
      url = File.join(self.class.resource_url, "computed_multiplier")
      self.class.post(url, {id: id})
    end
  end
end

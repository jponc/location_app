require 'httparty'

module LocationApp
  module APIOperations
    module Request
      include HTTParty

      def get(url, query={})
        HTTParty.get(full_url(url), query: query, headers: headers)
      end

      def post(url, body = {})
        HTTParty.post(full_url(url), body: body.to_json ,headers: headers)
      end

      def full_url(url)
        File.join(LocationApp.api_base, url)
      end

      def headers
        {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        }
      end

    end
  end
end

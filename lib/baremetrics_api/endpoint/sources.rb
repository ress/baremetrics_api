module BaremetricsAPI
  module Endpoint
    class Sources
      PATH = 'sources'.freeze

      def initialize(client)
        @client = client
      end

      def list_sources
        JSON.parse(sources_request.body).with_indifferent_access
      end

      private

      def sources_request
        @client.connection.get do |req|
          req.url PATH
        end
      end
    end
  end
end

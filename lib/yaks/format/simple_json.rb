module Yaks
  class Format
    class SimpleJson < self
      register :simple_json, :json, 'application/json'

      include FP

      # @param [yaks::resource] resource
      # @return [hash]
      def serialize_resource(resource)
        result = {}
        items = if resource.is_a?(Yaks::CollectionResource)
                  resource.members.map {|r| serialize_item(r)}
                else
                  serialize_item(resource.attributes)
                end
        result[pluralize(resource.type)] = items

        result
      end

      # @param [yaks::resource] resource
      # @return [hash]
      def serialize_item(resource)
        resource.attributes
      end

      # @param [Yaks::Resource] subresource
      # @return [Hash]
      def serialize_links(subresources)
        {}
      end

      # @param [Yaks::Resource] resource
      # @return [Array, String]
      def serialize_link(resource)
        {}
      end

      # @param [Hash] subresources
      # @param [Array] array
      # @return [Array]
      def serialize_linked_subresources(subresources, array)
        []
      end

      # @param [Array] resources
      # @param [Array] linked
      # @return [Array]
      def serialize_linked_resources(subresource, linked)
        []
      end

      # {shows => [{id: 3, name: 'foo'}]}
      #
      # @param [Yaks::Resource] resource
      # @param [Hash] linked
      # @return [Hash]
      def serialize_subresource(resource, linked)
        serialize_resource(resource)
      end

      def inverse
        Yaks::Reader::SimpleJson.new
      end
    end

    class Reader
    end
  end
end

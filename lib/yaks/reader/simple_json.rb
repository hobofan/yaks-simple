module Yaks
  module Reader
    class SimpleJson
      def call(parsed_json, env = {})
        type = env[:type] || parsed_json.first.first
        attributes = env[:attributes] || parsed_json[type]

        if attributes.is_a? Array
          attributes = attributes.dup
          members = attributes.map { |r| call(r, type: type, attributes: r) }
          CollectionResource.new(members: members, type: Util.singularize(type))
        else
          Resource.new(
            type: Util.singularize(type),
            attributes: Util.symbolize_keys(attributes)
          )
        end
      end
    end
  end
end

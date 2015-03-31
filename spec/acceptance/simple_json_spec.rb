require 'acceptance/json_shared_examples'

describe Yaks::Format::SimpleJson do
  config = Yaks.new do
    default_format :simple_json
    skip :serialize
  end

  include_examples 'JSON output format', config, :simple_json, 'confucius'
  include_examples 'JSON round trip',    config, :simple_json, 'confucius'
end

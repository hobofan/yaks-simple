require "yaks/simple/version"

require 'yaks/format/simple_json'
require 'yaks/reader/simple_json'

module Yaks
  module Simple
    # Set the Root constant as the gems root path
    Root = Pathname(__FILE__).join('../../..')
  end
end

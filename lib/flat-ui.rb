require "flat-ui/version"

module FlatUI
  module Rails
    if ::Rails.version.to_s < "3.1"
      require "flat-ui/railtie"
    else
      require 'flat-ui/engine'
    end
  end
end

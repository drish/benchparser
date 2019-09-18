require "benchparser/version"

module Benchparser
  class ParseError < StandardError; end

  class << self
    def parse
    end
  end
end

# shortcut
Bp = Benchparser

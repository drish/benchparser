# version
require "benchparser/version"

# modules
require "benchparser/result"
require "benchparser/parsers/go"
require "benchparser/parsers/ruby"
require "benchparser/parsers/ts"

module Benchparser
  class ParseError < StandardError; end

  class << self
    def parse
    end
  end
end

# shortcut
Bp = Benchparser

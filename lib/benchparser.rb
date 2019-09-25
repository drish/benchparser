# version
require "benchparser/version"

# modules
require "benchparser/result"
require "benchparser/parsers/go"
require "benchparser/parsers/ruby"
require "benchparser/parsers/ts"

module Benchparser
  class ParseError < StandardError; end
  class UnsupportedLang < StandardError; end

  class << self

    def parse(lang, data)

      raise UnsupportedLang if lang.nil?
      case lang.to_sym
      when :go
        Benchparser::Parsers::Go.parse(data)
      else
        raise UnsupportedLang.new("unsupported language #{lang.to_s}")
      end
    end
  end
end

# shortcut
Bp = Benchparser

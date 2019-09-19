module Benchparser

  class Result
    attr_accessor :language, :functions

    def initialize(language:)
      @language = language
      @functions = []
    end
  end
end

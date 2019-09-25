module Benchparser

  class Result
    attr_accessor :language, :functions, :configs

    def initialize(language:)
      @language = language
      @functions = []
      @configs = {}
    end
  end
end

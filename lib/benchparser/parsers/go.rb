module Benchparser
  module Parsers
    class Go < Benchparser::Result
      attr_accessor :goos, :goarch, :pkg

      def initialize(raw_data)
        super(language: 'go')
        lines = raw_data.split("\n")
        lines.each_with_index do |line, index|
          case index
          when 0
            @goos = line.sub('goos: ', '') if line.include?('goos')
          when 1
            @goarch = line.sub('goarch: ', '') if line.include?('goarch')
          when 2
            @pkg = line.sub('pkg: ', '') if line.include?('pkg')
          else
            parsed_line = parse_function(line)
            @functions << parsed_line unless parsed_line.nil?
          end
        end
      end

      def parse_function(line)
        fn = line.split(' ')
        return if fn.include?('PASS') or fn.include?('ok')
        {
          name: fn.first,
          iterations: fn[1],
          ns_op: fn[2],
          bytes_op: fn[4],
          allocs_op: fn[6]
        }
      end

      class << self
        def parse(raw_data)
          raise Bp::ParserError.new if raw_data.nil?
          Bp::Parsers::Go.new(raw_data)
        end
      end
    end
  end
end

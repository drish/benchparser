module Benchparser
  module Parsers
    class Go < Benchparser::Result

      def initialize(raw_data)
        super(language: 'go')
        lines = raw_data.split("\n")

        lines.each_with_index do |line, index|

          return if line.include?('PASS') or line.include?('ok')

          if line.start_with?('Benchmark')
            parsed_line = parse_function(line)
            @functions << parsed_line unless parsed_line.nil?
          else
            config = line.split(':')
            @configs[config.first.to_sym] = config[1].strip unless config.first.nil? or config[1].nil?
          end
        end
      end

      # finds the metric by calculating the index of the metric - 1
      def get_metric(line_array, metric)
        metric_index = line_array.find_index(metric)
        metric_index.nil? ? nil : line_array[metric_index - 1]
      end

      def parse_function(line)

        line_array = line.split(' ')
        parsed = {}
        parsed[:name] = line_array.first
        parsed[:iterations] = line_array[1]
        parsed[:ns_op] = get_metric(line_array, 'ns/op')
        parsed[:allocs_op] = get_metric(line_array, 'allocs/op')
        parsed[:mb_s] = get_metric(line_array, 'MB/s')
        parsed[:bytes_op] = get_metric(line_array, 'B/op')
        parsed
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

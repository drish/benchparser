# Benchparser

Benchparser is a parser for multiple benchmark output formats

## Installation

```ruby
gem 'benchparser'
```


#### Usage

Golang benchmark standard output 
```ruby
require 'benchparser'

out = Benchparser.parse(str)
out.allocations_per_second
```

Ruby [benchmark](https://ruby-doc.org/stdlib-2.5.0/libdoc/benchmark/rdoc/Benchmark.html)
```
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drish/benchparser.

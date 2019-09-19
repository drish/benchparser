[![Build Status](https://travis-ci.com/drish/benchparser.svg?branch=master)](https://travis-ci.com/drish/benchparser)

# Benchparser

Benchparser is a parser for multiple benchmark output formats

## Installation

```ruby
gem 'benchparser'
```


### Usage

Golang benchmark standard output 

```ruby
require 'benchparser'

data = "
goos: darwin
goarch: amd64
pkg: github.com/drish/parser
BenchmarkFib1-8     1000000000           2.48 ns/op        0 B/op        0 allocs/op
PASS
ok    github.com/drish/parser 9.960s
"

parsed = Bp.parse(data)
parsed.language # go
parsed.goos # darwin
parsed.pkg # darwin
parsed.functions.count # 1
parsed.functions.first[:iterations] # 1000000000
```


Ruby [benchmark](https://ruby-doc.org/stdlib-2.5.0/libdoc/benchmark/rdoc/Benchmark.html)
```
require 'benchparser'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drish/benchparser.

[![Build Status](https://travis-ci.com/drish/benchparser.svg?branch=master)](https://travis-ci.com/drish/benchparser)
[![Gem Version](https://badge.fury.io/rb/benchparser.svg)](https://badge.fury.io/rb/benchparser)

# Benchparser

Benchparser is a parser for multiple benchmark output formats

## Installation

```ruby
gem 'benchparser'
```


### Usage

Golang benchmark standard output

```text
goos: darwin
goarch: amd64
pkg: github.com/drish/parser
BenchmarkFib1-8     1000000000           2.48 ns/op        0 B/op        0 allocs/op
PASS
ok    github.com/drish/parser 9.960s
"
```

```ruby
require 'benchparser'

parsed = Bp.parse(:go, data)
parsed.language # go
parsed.configs[:goos] # darwin
parsed.configs[:pkg] # darwin
parsed.functions.count # 1
parsed.functions.first[:iterations] # 1000000000
parsed.functions.first[:ns_op] # 2.48
parsed.functions.first[:bytes_op] # 0
parsed.functions.first[:allocs_op] # 0
```


#### TODO

- [ ] Ruby [benchmark](https://ruby-doc.org/stdlib-2.5.0/libdoc/benchmark/rdoc/)
- [ ] Python [timeit](https://docs.python.org/2/library/timeit.html)
- [ ] Rust [Criterion](https://github.com/bheisler/criterion.rs)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drish/benchparser.

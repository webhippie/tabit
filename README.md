# Tabit

[![Gem Version](http://img.shields.io/gem/v/tabit.svg)](https://rubygems.org/gems/tabit)
[![Build Status](https://secure.travis-ci.org/webhippie/tabit.svg)](https://travis-ci.org/webhippie/tabit)
[![Code Climate](https://codeclimate.com/github/webhippie/tabit.svg)](https://codeclimate.com/github/webhippie/tabit)
[![Test Coverage](https://codeclimate.com/github/webhippie/tabit/badges/coverage.svg)](https://codeclimate.com/github/webhippie/tabit)
[![Dependency Status](https://gemnasium.com/webhippie/tabit.svg)](https://gemnasium.com/webhippie/tabit)

Tabit is a simple tab menu generator. It depends on `active_link_to`
helper. If you dont know how to set an item active take a look at it first.
The generated source is compatible to bootstrap tabs with dropdowns.


## Installation

```ruby
gem "tabit", "~> 1.0.0"
```


## Usage

```ruby
= tabit :class => "nav nav-tabs" do |t1|
  - t1.heading "Header"
  - t1.add "Videos", videos_path
  - t1.divider
  - t1.add "Movies", movies_path, active: /movies(\/\d)*(\/edit)*$/
  - t1.add "Movies, movies_path, active: :exclusive, type: :dropdown do |t2|
    - t2.add "Add movie", new_movie_path, active: :exclusive
```


## Contributing

Fork -> Patch -> Spec -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Other contributors](https://github.com/webhippie/tabit/graphs/contributors)


## License

MIT


## Copyright

```
Copyright (c) 2012-2015 Webhippie <http://www.webhippie.de>
```

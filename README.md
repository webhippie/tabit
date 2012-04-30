# Tabit [![Build Status](https://secure.travis-ci.org/Langwhich/tabit)](https://secure.travis-ci.org/Langwhich/tabit.png)

Tabit is a simple tab menu generator. It depends on `active_link_to`
helper. If you dont know how to set an item active take a look at it first.
The generated source is compatible to bootstrap tabs with dropdowns.

## Install

 ```ruby
 gem 'tabit'
 ```

## Usage

 ```ruby
 = tabit :class => 'nav nav-tabs' do |t1|
   - t1.add 'Videos', videos_path
   - t1.add 'Movies', movies_path, :active => /movies(\/\d)*(\/edit)*$/
   - t1.add 'Movies, movies_path, :active => :exclusive, :type => :dropdown do |t2|
     - t2.add 'Add movie', new_movie_path, :active => :exclusive
 ```

## Credits

Copyright (c) 20112 Langwhich GmbH <http://www.langwhich.com>


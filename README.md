# Tabit [![Build Status](https://secure.travis-ci.org/eifion/tabit.png)](https://secure.travis-ci.org/eifion/tabit.png)

Tabit is a simple tab menu generator. It depends on `active_link_to`
helper. If you dont know how to set an item active take a look at it first.

## Install

 ```ruby
 gem 'tabit'
 ```

## Usage

 ```ruby
 = tabit 'nav nav-tabs' do |t|
   = t.add 'Videos', videos_path
   = t.add 'Movies', movies_path, :active => /movies(\/\d)*(\/edit)*$/
   = t.add 'Add movie, new_movies_path, :active => :exclusive
 ```

## Credits

Copyright (c) 2011 Langwhich GmbH <http://www.langwhich.com>

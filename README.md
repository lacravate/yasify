# Yasify

"Yet Another Stupid Idea Featuring YAML".
This is a little utility to CRUD data in YAML file, in a simple manner,
hopefully.

It heavily relies on another gem of mine `pathstring`, if you want to
understand how it all works.

This is really not aimed at being super smart or fast. If you don't care about
speed, well, use it, it's simple and convenient.

## Installation

Ruby 1.9.2 is required.

Install it with rubygems:

    gem install yasify

With bundler, add it to your `Gemfile`:

``` ruby
gem "yasify"
```

## Use


```ruby
require 'yasify'

# tell what's the file name
# if it already exists, content will be made available as the data structure
# the YAML represents
y = Yasify.new '/home/dir/path/to/yaml.yml'

# equivalent to, thanks to Pathstring
y = Yasify.join 'home', 'dir', 'path', 'to', 'yaml.yml'

# if you want to assign a hole hash
# not persisted though
y.unit = {a: 1, b: 2}

# values will be available with
y[:a] # => 1

# assignments are done as could be expected
y[:c] = 12

# persistence as well
y.save! # this will make a mkdir -p on parent dir if need be

# want the whole thing as a hash ?
y.read # => {a: 1, b: 2, c: 12}

```

## Copyright

I was tempted by the WTFPL, but i have to take time to read it.
So far see LICENSE.

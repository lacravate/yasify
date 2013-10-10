# encoding: utf-8

# Explaining to bundler the whole lineage is the most painless and lasting
# way to have this working. So...

class PathstringInterface < String; end

class Pathstring < PathstringInterface; end

class Yasify < Pathstring
  VERSION = "0.0.1"
end

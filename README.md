# TreeConfig
![](https://badge.fury.io/rb/tree_config.svg)

![](https://travis-ci.org/huydx/tree_config.svg)

Rails very simple configuration gem, which use "folder structure" as settings key

## Installation

Add this line to your application's Gemfile:

```ruby
    gem 'tree_config'
```

And then execute:

```
    $ bundle
```

Or install it yourself as:

```
    $ gem install tree_config
```

## Usage
Use rails generator to generate default config folder
```
rails g tree_config:install 
```

This will generate `config/initializers/rails_config.rb` and generate a default config folder `config/settings` with `common.yml` file.

## Accessing the Settings object
Generally, all settings will be set into global `Settings` variable.
Folder name, file name will be use as key, and content of file will be set as this key's value. For example, given the follow settings folder structure

```
-config
  |-folder1
    -A.yml
    -B.yml
  |-folder2
    |-folder3
      -C.yml
```

Then we can access A.yml content by `Settings.folder1.A`.
The content of A is access by properties notation (For example Settings.folder1.A.var1)

## Contributing

1. Fork it ( http://github.com/huydx/tree_config/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
. Create new Pull Request

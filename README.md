# abstract_class [![Build Status](https://travis-ci.org/shuber/abstract_class.svg?branch=master)](https://travis-ci.org/shuber/abstract_class) [![Code Climate](https://codeclimate.com/github/shuber/abstract_class/badges/gpa.svg)](https://codeclimate.com/github/shuber/abstract_class) [![Coverage](https://codeclimate.com/github/shuber/abstract_class/badges/coverage.svg)](https://codeclimate.com/github/shuber/abstract_class)

> Abstract classes in Ruby.

Like modules, abstract classes *cannot be instantiated*.

Unlike modules, abstract classes can be inherited and their *derived classes can be instantiated*.

Check out the [java] or [php] implementations for additional examples.

[java]: http://docs.oracle.com/javase/tutorial/java/IandI/abstract.html
[php]: http://php.net/manual/en/language.oop5.abstract.php

## Installation

```
gem install abstract_class
```


## Usage

Define an abstract class

```ruby
module ActiveRecord
  class Base
    extend AbstractClass
  end
end
```

Try to initialize or allocate an instance of the class

```ruby
ActiveRecord::Base.new      #=> AbstractClass::Error - abstract class ActiveRecord::Base can't be instantiated
ActiveRecord::Base.allocate #=> AbstractClass::Error - abstract class ActiveRecord::Base can't be allocated
```

Define a child class derived from an abstract class

```ruby
class User < ActiveRecord::Base
end
```

Instantiation/allocation works like normal

```ruby
User.new      #=> #<User:0x003d066d5a861d>
User.allocate #=> #<User:0x007f87588491d0>
```


## Testing

```
bundle exec rspec
```


## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with Rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


## License

[MIT] - Copyright © 2011 Sean Huber

[MIT]: https://github.com/shuber/abstract_class/blob/master/LICENSE

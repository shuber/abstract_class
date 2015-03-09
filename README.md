# [![Sean Huber](https://cloud.githubusercontent.com/assets/2419/6550752/832d9a64-c5ea-11e4-9717-6f9aa6e023b5.png)](https://github.com/shuber) abstract_class [![Build Status](https://travis-ci.org/shuber/abstract_class.svg?branch=master)](https://travis-ci.org/shuber/abstract_class) [![Code Climate](https://codeclimate.com/github/shuber/abstract_class/badges/gpa.svg)](https://codeclimate.com/github/shuber/abstract_class) [![Coverage](https://codeclimate.com/github/shuber/abstract_class/badges/coverage.svg)](https://codeclimate.com/github/shuber/abstract_class)

> Abstract classes in Ruby.

Like modules, abstract classes **cannot be instantiated**.

Unlike modules, abstract classes can be inherited and their **derived classes can be instantiated**.

Check out the [java] or [php] implementations for additional examples.

[java]: http://docs.oracle.com/javase/tutorial/java/IandI/abstract.html
[php]: http://php.net/manual/en/language.oop5.abstract.php

## Installation

```
gem install abstract_class
```


## Usage

To make a class *abstract*, simply extend the `AbstractClass` module.

```ruby
module ActiveRecord
  class Base
    extend AbstractClass
  end
end
```

Any attempts to initialize or allocate an instance of an *abstract* class raises `AbstractClass::Error`.

```ruby
ActiveRecord::Base.new      #=> AbstractClass::Error - abstract class ActiveRecord::Base can't be instantiated
ActiveRecord::Base.allocate #=> AbstractClass::Error - abstract class ActiveRecord::Base can't be allocated
```

Child classes can inherit from an *abstract* class.

```ruby
class User < ActiveRecord::Base
end
```

Instantiation and allocation behaves like normal for descendants of *abstract* classes.

```ruby
User.new      #=> #<User:0x003d066d5a861d>
User.allocate #=> #<User:0x007f87588491d0>
```


## API

[YARD Documentation](http://www.rubydoc.info/github/shuber/abstract_class/master)


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

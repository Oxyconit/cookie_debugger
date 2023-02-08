# CookieDebugger

Easily debug `ActionDispatch::Cookies::CookieOverflow` error in your rails app by having the key size information in your logs
```
CookieDebugger (total size: 17 bytes) from url: http://localhost:3000/ | Cookie: [username=8] | Session: [calculation=4098] [_csrf_token=43] [session_id=32] [session_key_one=3]
```

### Motivation
I had a problem to reproduce `CookieOverflow` error on my local machine. I made a blog post about the problem with debugging cookies on production [here.](https://blog.oxyconit.com/how-to-debug-cookies-in-rails/)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cookie_debugger

or manually by adding `gem 'cookie_debugger'` into your Gemfile.

## Usage
Create a new file in the `config/initializers` folder

```ruby
# config/initializers/my_cookie_debugger.rb

module MyCookieDebugger
  def log_error(request, wrapper)
    if wrapper.exception.class == ActionDispatch::Cookies::CookieOverflow
      # put information in standard logger(visible in logs file)
      # cat log/development.log | grep CookieDebugger
      logger(request).public_send(:error, ::CookieDebugger::Debug.call(request))

      # or send a message to slack or whatever
      # ::Notify::Slack::Channel::Error.call(message: ::CookieDebugger::Debug.call(request))
    end

    super(request, wrapper)
  end
end

ActionDispatch::DebugExceptions.prepend(MyCookieDebugger)
```
Then **restart** the app and check the logs in your console or via bash command:
```bash
cat log/development.log | grep CookieDebugger
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

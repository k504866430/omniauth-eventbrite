# OmniAuth Eventbrite

This gem contains the Eventbrite strategy for OmniAuth 2.0.

*Notice*: Versions 0.0.1 through 0.0.5 use Eventbrite API v1, which is due to
be deprecated within two months of 2015-04-30. Versions after that will use
Eventbrite API v3. This will affect the user_id that you get back from the API
but your auth_token should remain the same.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-eventbrite', '~> 0.0.6'
```

Then `bundle install`.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :eventbrite, ENV['EVENTBRITE_CLIENT_ID'], ENV['EVENTBRITE_CLIENT_SECRET']
end
```

You can find your client secret on the same page where your application API key is.

## Referral Program Code

If you participate in the [Eventbrite Referral Program][referral], you can also
include your referral code as a parameter in all of your OAuth2 authentications
by including it in the builder block:

```ruby
use OmniAuth::Builder do
  provider :eventbrite, ENV['EVENTBRITE_CLIENT_ID'],
                        ENV['EVENTBRITE_CLIENT_SECRET'],
                        ref: 'EVENTBRITE_REFERRAL_CODE'
end
```

[referral]: https://www.eventbrite.com/referral-program/

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations
of this scheme should be reported as bugs.

[semver]: http://semver.org/spec/v2.0.0.html

## License

Copyright (c) 2012 Kruttik Aggarwal

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

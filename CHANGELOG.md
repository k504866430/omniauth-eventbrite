# Change Log

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning 2.0.0][semver].

## [Unreleased][unreleased]

### Changed

- *Breaking*: Switched the identity retrieval to the newer API v3 endpoint.
  This will cause any retrieved user_id to change to the v3 standard, which
  is incompatible with the v1 API. Eventbrite is deprecating API v1 within
  the next two months, so if this is breaks your code you should update to
  the newer API.
- Relaxed omniauth-oauth2 dependency to ~> 1.0 to ease use with other oauth2
  providers.
- Added support for a "ref" parameter for the Eventbrite Referral Program.

## [0.0.5] - 2013-12-17

### Changed

- Bugfix: Ensure raw_info at least returns an empty hash.

## [0.0.4] - 2012-09-20

### Changed

- user_id is now set as a string instead of an integer to match other
  providers.
- Bugfix: Improve name handling for users with missing first or last names.

## [0.0.3] - 2012-02-16

### Changed

- Bugfix: user_id was being pulled from the wrong attribute.

## [0.0.2] - 2012-02-16

### Changed

- Bugfix: Raw hashes were not being pruned properly.

[semver]: http://semver.org/spec/v2.0.0.html
[unreleased]: https://github.com/k504866430/omniauth-eventbrite/compare/v0.0.5...HEAD
[0.0.5]: https://github.com/k504866430/omniauth-eventbrite/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/k504866430/omniauth-eventbrite/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/k504866430/omniauth-eventbrite/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/k504866430/omniauth-eventbrite/compare/v0.0.1...v0.0.2

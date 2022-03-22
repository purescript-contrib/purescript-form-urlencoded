# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:
- Update project and deps to PureScript v0.15.0 (#27 by @JordanMartinez)

New features:

Bugfixes:

Other improvements:
- Added `purs-tidy` formatter (#26 by @thomashoneyman)

## [v6.0.2](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v6.0.2) - 2021-06-16

Bugfixes:
- Fixed encoding of spaces. Spaces must be replaced by `+` instead of `%20` (#24 by @dederer)

## [v6.0.1](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v6.0.1) - 2021-02-26

Other improvements:
- Fixed link to js-uri in bower.json

## [v6.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v6.0.0) - 2021-02-26

Breaking changes:
- Added support for PureScript 0.14 and dropped support for all previous versions (#20)

Other improvements:
- Added tests for `decode` and `encode` (#15 by @nsaunders)
- Changed default branch to `main` from `master`
- Updated to comply with Contributors library guidelines by adding new issue and pull request templates, updating documentation, and migrating to Spago for local development and CI (#18, #19)

## [v5.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v5.0.0) - 2019-08-14

- The previous `encode` function had a type signature which assumed it would always succeed, but the underlying function used from JavaScript could throw an exception. That exception is now caught and the `encode` function returns a `Maybe String`. To recover the previous implementation when you _know_ the encoding is valid, you can use `unsafePartial` on the `Maybe` result. (@nsaunders)
- There is now a `decode` function (@nsaunders)

## [v4.0.1](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v4.0.1) - 2018-06-23

- Added metadata including contributor guidelines and pushed latest release to Pursuit

## [v4.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v4.0.0) - 2018-05-25

- Updated for PureScript 0.12

## [v3.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v3.0.0) - 2017-04-03

- Updated for PureScript 0.11

## [v2.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v2.0.0) - 2016-10-27

- Updated for 2.0 core libraries and psc-0.10.

## [v1.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v1.0.0) - 2016-06-09

- Updated for 1.0 core libraries.

## [v0.3.1](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.3.1) - 2016-02-10

- Updated in advance of PureScript 0.8. This release uses pre-0.8 import syntax, after purescript-0.8.1 would be released that compatibility would be removed.

## [v0.3.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.3.0) - 2016-02-10

- Removed `Requestable` instance and dependency on `purescript-affjax`.
  The instance should be added to `purescript-affjax` in the near future.

## [v0.2.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.2.0) - 2016-02-07

- Hid the internals of `FormURLEncoded`

## [v0.1.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.1.0) - 2016-02-05

- Initial versioned release.

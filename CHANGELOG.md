# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes (😱!!!):

New features:

Bugfixes:

Other improvements:

## [v5.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v5.0.0) - 2019-08-14

* The previous `encode` function had a type signature which assumed it would always succeed, but the underlying function used from JavaScript could throw an exception. That exception is now caught and the `encode` function returns a `Maybe String`. To recover the previous implementation when you _know_ the encoding is valid, you can use `unsafePartial` on the `Maybe` result. (@nsaunders)
* There is now a `decode` function (@nsaunders)

## [v4.0.1](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v4.0.1) - 2018-06-23

- Adds metadata including contributor guidelines
- Pushes latest release to Pursuit

## [v4.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v4.0.0) - 2018-05-25

Updates for 0.12

## [v3.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v3.0.0) - 2017-04-03

- Updated for PureScript 0.11

## [v2.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v2.0.0) - 2016-10-27

Updates for 2.0 core libraries and psc-0.10.

## [v1.0.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v1.0.0) - 2016-06-09

Updates for 1.0 core libraries.

## [v0.3.1](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.3.1) - 2016-02-10

This release uses pre-0.8 import syntax, after purescript-0.8.1 would be released that compatibility would be removed.

## [v0.3.0](https://github.com/purescript-contrib/purescript-form-urlencoded/releases/tag/v0.3.0) - 2016-02-10

Breaking changes:
- removes `Requestable` instance and dependency on `purescript-affjax`.
  That instance should be added to `purescript-affjax` in the nearest future.


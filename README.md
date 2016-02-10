# purescript-form-urlencoded

[![Documentation](https://pursuit.purescript.org/packages/purescript-form-urlencoded/badge)](http://pursuit.purescript.org/packages/purescript-form-urlencoded)
[![Latest release](http://img.shields.io/bower/v/purescript-form-urlencoded.svg)](https://github.com/zudov/purescript-form-urlencoded/releases)
[![Build Status](https://travis-ci.org/zudov/purescript-form-urlencoded.svg?branch=master)](https://travis-ci.org/zudov/purescript-form-urlencoded)

A `FormURLEncoded` datatype represents an ordered list of key-value pairs
with possible duplicates. This package provides `encode` function which encodes
`FormURLEncoded` into string according to `application/x-www-form-urlencoded`.

Appropriate `Requestable` instance allows to use `FormURLEncoded` with `purescript-affjax`.

Documentation is available on [Pursuit][Pursuit].

[Pursuit]: https://pursuit.purescript.org/packages/purescript-form-urlencoded

Example:

```haskell
> import Data.FormURLEncoded (fromArray, encode)
> import Data.Maybe (Maybe(..))
> import Data.Tuple (Tuple(..))

> encode (fromArray [ Tuple "hey" Nothing
>                   , Tuple "Oh" (Just "Let's go!")
>                   ])
"hey&Oh=Let's%20go!"
```

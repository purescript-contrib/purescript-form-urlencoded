# purescript-form-urlencoded

A `FormURLEncoded` datatype represents an ordered list of key-value pairs
with possible duplicates. This package provides `encode` function which encodes
`FormURLEncoded` into string according to `application/x-www-form-urlencoded`
Appropriate `Requestable` instance allows to use `FormURLEncoded` with `purescript-affjax`.

Documentation is available on [Pursuit][Pursuit].

[Pursuit]: https://pursuit.purescript.org/packages/purescript-form-urlencoded

Example:

```haskell
> import Data.FormURLEncoded (FormURLEncoded(..), encode)
> import Data.Maybe (Maybe(..))
> import Data.Tuple (Tuple(..))
> encode (FormURLEncoded [ Tuple "foo" (Just "bar"), Tuple "baz" (Just "qux") ])
"foo=bar&baz=qux"
> encode (FormURLEncoded [ Tuple "hey" (Just "Hey!"), Tuple "Oh" (Just "Let's go!") ])
"hey=Hey!&Oh=Let's%20go!"
```

module Data.FormURLEncoded
  ( FormURLEncoded(FormURLEncoded)
  , NameValue(NameValue)
  , fromArray
  , toArray
  , encode
  , encodeNameValue
  ) where

import Data.Newtype (class Newtype)
import Data.Generic (class Generic, gShow)
import Data.Maybe (Maybe(..))
import Data.Monoid (class Monoid)
import Data.Semigroup (class Semigroup)
import Data.String (joinWith) as String
import Global (encodeURIComponent)
import Prelude (class Show, class Ord, class Eq, map, (<<<), (<>))

-- | `FormURLEncoded` is an ordered list of name-value pairs with possible duplicates.
newtype FormURLEncoded
  = FormURLEncoded
      (Array NameValue)

newtype NameValue
  = NameValue
      { name :: String, value :: Maybe String }

-- | Construct `FormURLEncoded` from an `Array` of name-value pairs.
fromArray :: Array NameValue -> FormURLEncoded
fromArray = FormURLEncoded

-- | View `FormURLEncoded` as an `Array` of name-value pairs.
toArray :: FormURLEncoded -> Array NameValue
toArray (FormURLEncoded a) = a

derive newtype instance genericFormUrlEncoded :: Generic FormURLEncoded
derive instance newtypeFormUrlEncoded :: Newtype FormURLEncoded _
derive newtype instance eqFormUrlEncoded :: Eq FormURLEncoded
derive newtype instance ordFormUrlEncoded :: Ord FormURLEncoded
derive newtype instance showFormUrlEncoded :: Show FormURLEncoded
derive newtype instance semigroupFormUrlEncoded :: Semigroup FormURLEncoded
derive newtype instance monoidFormUrlEncoded :: Monoid FormURLEncoded

derive instance genericNameValue :: Generic NameValue
derive instance eqNameValue :: Eq NameValue
derive instance ordNameValue :: Ord NameValue
instance showNameValue :: Show NameValue where
  show = gShow

-- | Encode `FormURLEncoded` as `application/x-www-form-urlencoded`.
encode :: FormURLEncoded -> String
encode = String.joinWith "&" <<< map encodeNameValue <<< toArray

encodeNameValue :: NameValue -> String
encodeNameValue (NameValue { name, value: Nothing }) = 
  encodeURIComponent name
encodeNameValue (NameValue { name, value: Just value }) =
  encodeURIComponent name
    <> "=" <>
  encodeURIComponent value

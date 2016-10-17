module Data.FormURLEncoded
  ( FormURLEncoded()
  , fromArray
  , toArray
  , encode
  ) where

import Prelude (class Show, class Ord, class Eq, map, (<<<), (<>))
import Data.String (joinWith) as String
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Data.Generic (class Generic)

import Global (encodeURIComponent)

-- | `FormURLEncoded` is an ordered list of key-value pairs with possible duplicates.
newtype FormURLEncoded
  = FormURLEncoded
      (Array (Tuple String (Maybe String)))

-- | Construct `FormURLEncoded` from an `Array` of key-value pairs.
fromArray :: Array (Tuple String (Maybe String)) -> FormURLEncoded
fromArray = FormURLEncoded

-- | View `FormURLEncoded` as an `Array` of key-value pairs.
toArray :: FormURLEncoded -> Array (Tuple String (Maybe String))
toArray (FormURLEncoded a) = a

derive instance genericFormUrlEncoded :: Generic FormURLEncoded
derive newtype instance eqFormUrlEncoded :: Eq FormURLEncoded
derive newtype instance ordFormUrlEncoded :: Ord FormURLEncoded
derive newtype instance showFormUrlEncoded :: Show FormURLEncoded

-- | Encode `FormURLEncoded` as `application/x-www-form-urlencoded`.
encode :: FormURLEncoded -> String
encode = String.joinWith "&" <<< map encodePart <<< toArray
  where
    encodePart (Tuple k Nothing) = encodeURIComponent k
    encodePart (Tuple k (Just v)) =
      encodeURIComponent k <> "=" <> encodeURIComponent v

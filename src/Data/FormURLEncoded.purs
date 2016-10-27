module Data.FormURLEncoded
  ( FormURLEncoded(FormURLEncoded)
  , fromArray
  , toArray
  , encode
  ) where

import Data.Newtype (class Newtype)
import Data.Generic (class Generic)
import Data.Maybe (Maybe(..))
import Data.Monoid (class Monoid)
import Data.Semigroup (class Semigroup)
import Data.String (joinWith) as String
import Data.Tuple (Tuple(..))
import Global (encodeURIComponent)
import Prelude (class Show, class Ord, class Eq, map, (<<<), (<>))

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
derive instance newtypeFormUrlEncoded :: Newtype FormURLEncoded _
derive newtype instance eqFormUrlEncoded :: Eq FormURLEncoded
derive newtype instance ordFormUrlEncoded :: Ord FormURLEncoded
derive newtype instance showFormUrlEncoded :: Show FormURLEncoded
derive newtype instance semigroupFormUrlEncoded :: Semigroup FormURLEncoded
derive newtype instance monoidFormUrlEncoded :: Monoid FormURLEncoded

-- | Encode `FormURLEncoded` as `application/x-www-form-urlencoded`.
encode :: FormURLEncoded -> String
encode = String.joinWith "&" <<< map encodePart <<< toArray
  where
    encodePart (Tuple k Nothing) = encodeURIComponent k
    encodePart (Tuple k (Just v)) =
      encodeURIComponent k <> "=" <> encodeURIComponent v

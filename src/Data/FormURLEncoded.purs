module Data.FormURLEncoded where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.String (joinWith) as String
import Data.Tuple (Tuple(..))
import Global.Unsafe (unsafeEncodeURIComponent)

-- | `FormURLEncoded` is an ordered list of key-value pairs with possible duplicates.
newtype FormURLEncoded = FormURLEncoded (Array (Tuple String (Maybe String)))

-- | Construct `FormURLEncoded` from an `Array` of key-value pairs.
fromArray :: Array (Tuple String (Maybe String)) -> FormURLEncoded
fromArray = FormURLEncoded

-- | View `FormURLEncoded` as an `Array` of key-value pairs.
toArray :: FormURLEncoded -> Array (Tuple String (Maybe String))
toArray (FormURLEncoded a) = a

derive instance newtypeFormUrlEncoded :: Newtype FormURLEncoded _
derive newtype instance eqFormUrlEncoded :: Eq FormURLEncoded
derive newtype instance ordFormUrlEncoded :: Ord FormURLEncoded
derive newtype instance semigroupFormUrlEncoded :: Semigroup FormURLEncoded
derive newtype instance monoidFormUrlEncoded :: Monoid FormURLEncoded

instance showFormUrlEncoded :: Show FormURLEncoded where
  show (FormURLEncoded kvs) = "(FormURLEncoded " <> show kvs <> ")"

-- | Encode `FormURLEncoded` as `application/x-www-form-urlencoded`.
encode :: FormURLEncoded -> String
encode = String.joinWith "&" <<< map encodePart <<< toArray
  where
    encodePart = case _ of
      Tuple k Nothing -> unsafeEncodeURIComponent k
      Tuple k (Just v) -> unsafeEncodeURIComponent k <> "=" <> unsafeEncodeURIComponent v

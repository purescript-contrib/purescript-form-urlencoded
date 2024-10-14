module Test.Main where

import Prelude

import Data.FormURLEncoded (FormURLEncoded(..), decode, encode)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)

main :: Effect Unit
main = do

  testDecode "a=aa&b=bb" (Just $ FormURLEncoded [ Tuple "a" $ Just "aa", Tuple "b" $ Just "bb" ])

  testDecode "this=this%3Dthis" (Just $ FormURLEncoded [ Tuple "this" $ Just "this=this" ])

  testDecode "&x=x&&y=y&z="
    $ Just
    $ FormURLEncoded
        [ Tuple "" Nothing
        , Tuple "x" $ Just "x"
        , Tuple "" Nothing
        , Tuple "y" $ Just "y"
        , Tuple "z" $ Just ""
        ]

  testDecode "a=b&%8A=c" Nothing

  testDecode "a+b=aa+bb" (Just $ FormURLEncoded [ Tuple "a b" $ Just "aa bb" ])

  testEncode (FormURLEncoded [ Tuple "a" $ Just "aa", Tuple "b" $ Just "bb" ]) $ Just "a=aa&b=bb"

  testEncode (FormURLEncoded [ Tuple "this" $ Just "this=this" ]) $ Just "this=this%3Dthis"

  testEncode
    ( FormURLEncoded
        [ Tuple "" Nothing
        , Tuple "x" $ Just "x"
        , Tuple "" Nothing
        , Tuple "y" $ Just "y"
        , Tuple "z" $ Just ""
        ]
    )
    (Just "&x=x&&y=y&z=")

  testEncode (FormURLEncoded [ Tuple "a b" $ Just "aa bb" ]) $ Just "a+b=aa+bb"

  where
  testDecode :: String -> Maybe FormURLEncoded -> Effect Unit
  testDecode input expected =
    (log $ "decode \"" <> input <> "\" == " <> show expected) *> assert (decode input == expected)

  testEncode :: FormURLEncoded -> Maybe String -> Effect Unit
  testEncode input expected =
    (log $ "encode " <> show input <> " == \"" <> show expected <> "\"") *> assert (encode input == expected)

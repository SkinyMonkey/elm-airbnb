module Flat.Decoder exposing (..)

import Flat.Types exposing (..)

import Json.Decode as JD exposing (field, string, int, float, Decoder)

flatDecoder : Decoder Flat
flatDecoder =
  JD.map6 Flat
        (field "name" string)
        (field "imageUrl" string)
        (field "price" int)
        (field "priceCurrency" string)
        (field "lat" float)
        (field "lng" float)

flatListDecoder : Decoder ( List Flat )
flatListDecoder = JD.list flatDecoder

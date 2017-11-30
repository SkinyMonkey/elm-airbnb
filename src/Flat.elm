module Flat exposing (flat, Flat)

import Html exposing (text, div, h3, img)
import Html.Attributes exposing (class, src)

type alias Flat = {
  name: String,
  imageUrl: String,
  price: Int,
  priceCurrency: String,
  lat: Float,
  lng: Float
}

flat record = div [ class "flat" ]
        [
         img [ src record.imageUrl ] [],
         h3 [] [text record.name ]
        ]

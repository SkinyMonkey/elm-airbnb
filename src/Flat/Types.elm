module Flat.Types exposing (..)

type alias Flat = {
  name: String,
  imageUrl: String,
  price: Int,
  priceCurrency: String,
  lat: Float,
  lng: Float
}

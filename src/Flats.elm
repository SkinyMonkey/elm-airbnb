module Flats exposing (flats)

import Html exposing (text, div, h1)
import Html.Attributes exposing (id)
import Json.Decode as JD exposing (field, string, int, float, Decoder)

import Flat exposing (flat)

type alias Flat = {
  name: String,
  imageUrl: String,
  price: Int,
  priceCurrency: String,
  lat: Float,
  lng: Float
}

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

testFlats = [{
    name="Charm at the Steps of the Sacre Coeur/Montmartre",
    imageUrl="https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg",
    price=164,
    priceCurrency="EUR",
    lat=48.884211,
    lng=2.346890
  },
  {
    name="Trendy Apt in Buttes Montmartre",
    imageUrl="https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat2.jpg",
    price=200,
    priceCurrency="EUR",
    lat=48.885707,
    lng=2.343543
  },
  {
    name="Super 60m2 in trendy neighborhood!",
    imageUrl="https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat3.jpg",
    price=150,
    priceCurrency="EUR",
    lat=48.885312,
    lng=2.341225
  }]

flats = div [ id "flats" ] (List.map flat testFlats)

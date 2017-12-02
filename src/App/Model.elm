module App.Model exposing (..)

import App.Types exposing (Model, Msg)
import Flat.Model exposing (emptyFlat)

testFlats = [{name="Charm at the Steps of the Sacre Coeur/Montmartre", imageUrl="https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg", price=164, priceCurrency="EUR", lat=48.884211, lng=2.34689}, {name="Trendy Apt in Buttes Montmartre",imageUrl="https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat2.jpg",price=200,priceCurrency="EUR",lat=48.885707,lng=2.343543}]

--, map = mapInit }
init : ( Model, Cmd Msg )
init = {
  search = "",
  flats = testFlats,
  allFlats = testFlats,
  selectedFlat = emptyFlat
  } ! []
  -- [ fetchFlats, mapInit |> toJsObject |> initializeMap ])

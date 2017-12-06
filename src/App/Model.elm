module App.Model exposing (..)

import App.Types exposing (Model, Msg)
import Flat.Model exposing (emptyFlat)
import Flat.Http exposing (fetchFlats)

import Map.Ports
import Map.Model

init : ( Model, Cmd Msg )
init = {
  search = "",
  flats = [],
  allFlats = [],
  selectedFlat = emptyFlat
  }
  !
  [ fetchFlats , Map.Model.init
              |> Map.Ports.toJsObject
              |> Map.Ports.initializeMap ]

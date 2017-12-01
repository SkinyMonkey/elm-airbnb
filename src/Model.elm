module Model exposing (..)

import Msg exposing (..)
import Flats exposing (fetchFlats)
import Flat exposing (Flat)
import Map
import Port

type alias Model = {
  search: String,
  flats: List Flat,
  map: Map.Model
}

model : Model
model = { search = "", flats = [], map = Map.init }

-- TODO : import fetchFlats
--        init flats with fetchFlats
init : ( Model, Cmd Msg )
init = model ! [ fetchFlats, Map.init |> Map.toJsObject |> Port.initializeMap ]

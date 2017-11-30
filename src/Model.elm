module Model exposing (..)

import Msg exposing (..)
import Flats exposing (fetchFlats)
import Flat exposing (Flat)

type alias Model = {
  search: String,
  flats: List Flat
}

model : Model
model = { search = "", flats = [] }

-- TODO : import fetchFlats
--        init flats with fetchFlats
init : ( Model, Cmd Msg )
init = model ! [ fetchFlats ]

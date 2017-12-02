module App.Types exposing (..)

import Flat.Types exposing (Flat)

--  map: Map,
type alias Model = {
  search: String,
  flats: List Flat,
  allFlats: List Flat,
  selectedFlat: Flat
}

type Msg
    = NoOp
    | Search String
    | SelectFlat Flat
--    | FetchFlats (Result Http.Error (List Flat))

module App.Types exposing (..)

--  map: Map,
--  allFlats: List Flat,
--  flats: List Flat,
--  selectedFlat: Flat
type alias Model = {
  search: String
}

type Msg
    = NoOp
    | Search String
--    | FetchFlats (Result Http.Error (List Flat))
--    | SelectFlat Flat

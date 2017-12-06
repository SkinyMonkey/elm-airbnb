module Flat.Http exposing (..)

import Http

import App.Types exposing (Msg(..))
import Flat.Decoder exposing (flatListDecoder)

flatsURL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

fetchFlats : Cmd Msg
fetchFlats = Http.get flatsURL flatListDecoder
        |> Http.send FetchFlats

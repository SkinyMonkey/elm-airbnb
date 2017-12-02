module Flat.Http exposing (..)

import Http

flatsURL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

fetchFlats : Cmd Msg
fetchFlats = Http.get flatsURL flatListDecoder
        |> Http.send FetchFlats

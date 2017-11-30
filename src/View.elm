module View exposing (appView)

import Html exposing (text, div, h1)
import Html.Attributes exposing (id)

import Flats exposing (flats)
import Search exposing (search)
import Map exposing (map)

appView model = div [ id "app" ]
        [
          div [ id "app-left" ] [search, flats model.search model.flats],
          map
        ]

module App.View exposing (..)

import Html exposing (div)
import Html.Attributes exposing (id)
import Search.View exposing (search)
import Flat.View exposing (flats)

view model = div [ id "app" ]
        [
          div [ id "app-left" ] [search, flats model.search model.flats]
          --div [ id "map" ]      [map]
        ]

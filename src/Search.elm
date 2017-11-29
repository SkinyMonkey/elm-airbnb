module Search exposing (search)

import Html exposing (div, input)
import Html.Attributes exposing (id, placeholder)

search = div [ id "search" ]
        [input [ placeholder "Filter flats" ] []]

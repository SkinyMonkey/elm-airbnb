module Search exposing (search)

import Html exposing (div, input)
import Html.Attributes exposing (id, placeholder)
import Html.Events exposing (onInput)

import Msg exposing (..)

search = div [ id "search" ]
        [input [ placeholder "Filter flats", onInput Search ] []]

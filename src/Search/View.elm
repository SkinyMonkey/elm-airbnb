module Search.View exposing (..)

import Html exposing (div, input)
import Html.Attributes exposing (id, placeholder)
import Html.Events exposing (onInput)

import App.Types exposing (Msg(..))

search = div [ id "search" ]
        [input [ placeholder "Filter flats", onInput Search ] []]

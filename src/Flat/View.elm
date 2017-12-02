module Flat.View exposing (..)

import Html exposing (text, div, img, h3)
import Html.Attributes exposing (src, id, class)
import Html.Events exposing (onClick)

import App.Types exposing (Msg(..))

flat record = div [ class "flat" , onClick (SelectFlat record) ]
        [
         img [ src record.imageUrl ] [],
         h3 [] [text record.name ]
        ]

flats search flats = div [ id "flats" ] (List.map flat flats)

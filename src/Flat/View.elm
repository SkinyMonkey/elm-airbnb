module Flat.View exposing (..)

import Html exposing (text, div, img)
import Html.Attributes exposing (src, id, class)
import Html.Events exposing (onClick)

flat record = div [ class "flat" , onClick (SelectFlat record) ]
        [
         img [ src record.imageUrl ] [],
         h3 [] [text record.name ]
        ]

flats search flats = let filteredFlats =
                   List.filter (flatByName search) flats
               in  div [ id "flats" ] (List.map flat filteredFlats)

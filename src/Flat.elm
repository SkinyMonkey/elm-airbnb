module Flat exposing (flat)

import Html exposing (text, div, h3, img)
import Html.Attributes exposing (class, src)

flat record = div [ class "flat" ]
        [
         img [ src record.imageUrl ] [],
         h3 [] [text record.name ]
        ]

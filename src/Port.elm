port module Port exposing (..)

import Map
import Flat exposing (Flat)


-- Outgoing Port


port initializeMap : Map.JsObject -> Cmd msg
port initializeMarkers : List Flat -> Cmd msg

port updateMarkers : List Flat -> Cmd msg
port setCenter : Flat -> Cmd msg

port initializeEditMap : Map.JsObject -> Cmd msg


port moveMap : Map.JsObject -> Cmd msg



-- Incoming Port


port mapMoved : (Map.JsObject -> msg) -> Sub msg

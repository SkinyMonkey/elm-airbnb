port module Map.Ports exposing (..)

type alias JsObject =
    { lat : Float
    , lng : Float
    }

toJsObject : Map -> JsObject
toJsObject (Internal model) =
    { lat = model.latitude
    , lng = model.longtitude
    }


-- Outcoming Port

port initializeMap : JsObject -> Cmd msg
port initializeMarkers : List Flat -> Cmd msg

port updateMarkers : List Flat -> Cmd msg
port setCenter : (Flat, Flat) -> Cmd msg

port initializeEditMap : JsObject -> Cmd msg


port moveMap : JsObject -> Cmd msg

-- Incoming Port

port mapMoved : (JsObject -> msg) -> Sub msg

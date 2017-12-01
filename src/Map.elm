module Map exposing (Model, JsObject, init, modify, toJsObject, map)

import Html exposing (div, h1, text)
import Html.Attributes exposing (id)

import Flat exposing (Flat)

map = h1 [] [ text "MAP" ]

type Model
    = Internal
        { latitude : Float
        , longtitude : Float
        , flats: List Flat
        }


init : Model
init =
    Internal
        { latitude = 11.55408504200135
        , longtitude = 104.910961602369
        , flats = []
        }


modify : Float -> Float -> Model -> Model
modify latitude longtitude (Internal model) =
    Internal
        { model
            | latitude = latitude
            , longtitude = longtitude
        }


type alias JsObject =
    { lat : Float
    , lng : Float
    , flats: List Flat
    }


toJsObject : Model -> JsObject
toJsObject (Internal model) =
    { lat = model.latitude
    , lng = model.longtitude
    , flats = []
    }

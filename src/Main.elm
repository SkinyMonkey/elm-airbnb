module Main exposing (..)

import App.View exposing (view)

import Html

import App.Model exposing (init)
import App.Types exposing (Model, Msg)
import App.State exposing (update)

---- PROGRAM ----

main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

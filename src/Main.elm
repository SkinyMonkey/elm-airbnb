module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)

import Msg exposing (..)
import Model exposing (..)
import View exposing (appView)

---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Search searchString ->
    ( { model | search = searchString }, Cmd.none )

    FetchFlats (Ok flats) ->
    ( { model | flats = flats }, Cmd.none )

    FetchFlats (Err _) ->
    ( model, Cmd.none )

    NoOp ->
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model = appView model



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

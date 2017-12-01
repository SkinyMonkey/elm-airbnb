module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)

import Msg exposing (..)
import Model exposing (..)
import View exposing (appView)

import Map
import Port

import Flats exposing (flatByName)

---- UPDATE ----

-- TODO : add allFlats in model
--        init it with fetchFlats
--        flats = allFlats
--        if search === "" flats = allFlats
--        else flats = filter allFlats
--        pass the result through ports

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Search searchString ->
    ( { model | search = searchString }, Port.updateMarkers (List.filter (flatByName searchString) model.flats) )

    FetchFlats (Ok flats) ->
    ( { model | flats = flats }, Port.initializeMarkers flats )

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

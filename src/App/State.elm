module App.State exposing (..)

import App.Types exposing (Model, Msg(..))
import Search.State exposing (..)
import Flat.State exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Search searchString ->
        let updatedModel = (Search.State.update searchString 
                         >> Flat.State.filterFlats searchString) model
        in ( updatedModel, Cmd.none )

--    FetchFlats (Ok flats) ->
--      let selectedFlat =
--        let maybeFlat = List.head flats
--        in  case maybeFlat of
--                Just flat -> flat
--                Nothing -> emptyFlat
--      in
--    ( { model | flats = flats, selectedFlat = selectedFlat }, initializeMarkers flats ) -- setCenter flats[0]
--
--    FetchFlats (Err _) ->
--    ( model, Cmd.none )
--
    SelectFlat flat ->
    ( Flat.State.selectFlat flat model, Cmd.none ) --, setCenter (flat, model.selectedFlat) )

    NoOp ->
    ( model, Cmd.none )

module App.State exposing (..)

import App.Types exposing (Model, Msg(..))
import Search.State exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Search searchString -> Search.State.update searchString model

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
--    SelectFlat flat ->
--    ( { model | selectedFlat = flat }, setCenter (flat, model.selectedFlat) )

    NoOp ->
    ( model, Cmd.none )

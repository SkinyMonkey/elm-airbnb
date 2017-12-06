module App.State exposing (..)

import App.Types exposing (Model, Msg(..))
import Search.State exposing (..)
import Flat.State exposing (..)
import Flat.Model exposing (emptyFlat)

import Map.Ports exposing (..)

getSelectedFlat model updatedModel =
  if List.member model.selectedFlat updatedModel.flats == True
  then model.selectedFlat
  else let maybeFlat = List.head updatedModel.flats
       in  case maybeFlat of
             Just flat -> flat
             Nothing -> emptyFlat

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Search searchString ->
        let updatedModel = (Search.State.update searchString 
                         >> Flat.State.filterFlats searchString) model
        in 
           let selectedFlat = getSelectedFlat model updatedModel
           in( updatedModel, updateMarkers (updatedModel.flats, selectedFlat) )

    FetchFlats (Ok flats) ->
      let selectedFlat =
        let maybeFlat = List.head flats
        in  case maybeFlat of
                Just flat -> flat
                Nothing -> emptyFlat
      in
    ( { model | allFlats = flats
              , flats = flats
              , selectedFlat = selectedFlat }
      ! [initializeMarkers flats, setCenter (selectedFlat, selectedFlat)] )

    FetchFlats (Err _) ->
    ( model, Cmd.none )

    SelectFlat flat ->
    ( Flat.State.selectFlat flat model, setCenter (flat, model.selectedFlat) )

    NoOp ->
    ( model, Cmd.none )

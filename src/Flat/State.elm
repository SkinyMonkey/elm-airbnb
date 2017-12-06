module Flat.State exposing (..)

import Regex

import App.Types exposing (Model)
import Flat.Types exposing (Flat)

flatByName : String -> Flat -> Bool
flatByName search flat =
  case search of
    "" -> True
    _ -> let nameRegex = Regex.regex (".*" ++ search ++ ".*")
                        |> Regex.caseInsensitive
         in  Regex.contains nameRegex flat.name

filterFlats : String -> Model -> Model
filterFlats searchString model =
        let filteredFlats = List.filter (flatByName searchString) model.allFlats
        in { model | flats = filteredFlats }

selectFlat flat model = { model | selectedFlat = flat }

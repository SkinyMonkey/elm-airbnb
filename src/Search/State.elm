module Search.State exposing (..)

import App.Types exposing (Model, Msg(..))

update : String -> Model -> Model
update searchString model = { model | search = searchString }

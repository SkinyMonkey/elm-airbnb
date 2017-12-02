module Search.State exposing (..)

import App.Types exposing (Model, Msg(..))

update : String -> Model -> ( Model, Cmd msg )
update searchString model = ({ model | search = searchString }, Cmd.none)

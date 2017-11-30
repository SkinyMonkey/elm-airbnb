module Msg exposing (..)

import Http
import Flat exposing (Flat)

type Msg
    = NoOp
    | Search String
    | FetchFlats (Result Http.Error (List Flat))

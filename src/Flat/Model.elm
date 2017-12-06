module Flat.Model exposing (..)

import Flat.Types exposing (Flat)

emptyFlat : Flat
emptyFlat = {lat=0, lng=0, name="", price=0, imageUrl="", priceCurrency=""}

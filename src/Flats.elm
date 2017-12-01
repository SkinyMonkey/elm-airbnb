module Flats exposing (flats, fetchFlats, flatByName)

import Http
import Html exposing (text, div, h1)
import Html.Attributes exposing (id)
import Json.Decode as JD exposing (field, string, int, float, Decoder)
import Regex
import Msg exposing (Msg)

import Flat exposing (flat, Flat)

flatDecoder : Decoder Flat
flatDecoder =
  JD.map6 Flat
        (field "name" string)
        (field "imageUrl" string)
        (field "price" int)
        (field "priceCurrency" string)
        (field "lat" float)
        (field "lng" float)

flatListDecoder : Decoder ( List Flat )
flatListDecoder = JD.list flatDecoder

flatsURL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

fetchFlats : Cmd Msg
fetchFlats = Http.get flatsURL flatListDecoder
        |> Http.send Msg.FetchFlats

flatByName : String -> Flat -> Bool
flatByName search flat =
  case search of
    "" -> True
    _ -> let nameRegex = Regex.regex (".*" ++ search ++ ".*")
                        |> Regex.caseInsensitive
         in  Regex.contains nameRegex flat.name

flats : String -> List Flat -> Html.Html msg
flats search flats = let filteredFlats =
                   List.filter (flatByName search) flats
               in  div [ id "flats" ] (List.map flat filteredFlats)

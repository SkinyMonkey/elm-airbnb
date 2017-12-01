port module Main exposing (..)

import Http
import Regex
import Html exposing (Html, text, div, h1, h3, img, input)
import Html.Attributes exposing (src, id, placeholder, class)
import Html.Events exposing (onInput, onClick)
import Json.Decode as JD exposing (field, string, int, float, Decoder)

---- Map ----

-- ports
port initializeMap : JsObject -> Cmd msg
port initializeMarkers : List Flat -> Cmd msg

port updateMarkers : List Flat -> Cmd msg
port setCenter : (Flat, Flat) -> Cmd msg

port initializeEditMap : JsObject -> Cmd msg


port moveMap : JsObject -> Cmd msg

-- Incoming Port

port mapMoved : (JsObject -> msg) -> Sub msg
---- 

map = h1 [] [ text "MAP" ]

type MapModel
    = Internal
        { latitude : Float
        , longtitude : Float
        , flats: List Flat
        }


mapInit : MapModel
mapInit =
    Internal
        { latitude = 11.55408504200135
        , longtitude = 104.910961602369
        , flats = []
        }


modify : Float -> Float -> MapModel -> MapModel
modify latitude longtitude (Internal model) =
    Internal
        { model
            | latitude = latitude
            , longtitude = longtitude
        }


type alias JsObject =
    { lat : Float
    , lng : Float
    , flats: List Flat
    }


toJsObject : MapModel -> JsObject
toJsObject (Internal model) =
    { lat = model.latitude
    , lng = model.longtitude
    , flats = []
    }
---- Search ----

search = div [ id "search" ]
        [input [ placeholder "Filter flats", onInput Search ] []]

---- Flat ----

type alias Flat = {
  name: String,
  imageUrl: String,
  price: Int,
  priceCurrency: String,
  lat: Float,
  lng: Float
}

flat record = div [ class "flat" , onClick (SelectFlat record) ]
        [
         img [ src record.imageUrl ] [],
         h3 [] [text record.name ]
        ]

---- Flats ----
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
        |> Http.send FetchFlats

flatByName : String -> Flat -> Bool
flatByName search flat =
  case search of
    "" -> True
    _ -> let nameRegex = Regex.regex (".*" ++ search ++ ".*")
                        |> Regex.caseInsensitive
         in  Regex.contains nameRegex flat.name

flats search flats = let filteredFlats =
                   List.filter (flatByName search) flats
               in  div [ id "flats" ] (List.map flat filteredFlats)

---- Model ----

type alias Model = {
  search: String,
  map: MapModel,
  flats: List Flat,
  selectedFlat: Flat
}

emptyFlat = {lat=0, lng=0, name="", price=0, imageUrl="", priceCurrency=""}

model : Model
model = { search = "", flats = [], selectedFlat = emptyFlat, map = mapInit }

init : ( Model, Cmd Msg )
init = model ! [ fetchFlats, mapInit |> toJsObject |> initializeMap ]

---- View ----

appView model = div [ id "app" ]
        [
          div [ id "app-left" ] [search, flats model.search model.flats],
          div [ id "map" ]      [map]
        ]


---- UPDATE ----

type Msg
    = NoOp
    | Search String
    | FetchFlats (Result Http.Error (List Flat))
    | SelectFlat Flat


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
    ( { model | search = searchString }, updateMarkers (List.filter (flatByName searchString) model.flats) )

    FetchFlats (Ok flats) ->
      let selectedFlat =
        let maybeFlat = List.head flats
        in  case maybeFlat of
                Just flat -> flat
                Nothing -> emptyFlat
      in
    ( { model | flats = flats, selectedFlat = selectedFlat }, initializeMarkers flats ) -- setCenter flats[0]

    FetchFlats (Err _) ->
    ( model, Cmd.none )

    SelectFlat flat ->
    ( { model | selectedFlat = flat }, setCenter (flat, model.selectedFlat) )

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

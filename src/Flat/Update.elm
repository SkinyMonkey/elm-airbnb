module Flat.State exposing ()

import Regex

flatByName : String -> Flat -> Bool
flatByName search flat =
  case search of
    "" -> True
    _ -> let nameRegex = Regex.regex (".*" ++ search ++ ".*")
                        |> Regex.caseInsensitive
         in  Regex.contains nameRegex flat.name

-- TODO : add allFlats in model
--        init it with fetchFlats
--        flats = allFlats
--        if search === "" flats = allFlats
--        else flats = filter allFlats
--        pass the result through ports

-- update 

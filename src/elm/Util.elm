module Util exposing (errorToString)

import Http exposing (Error(..))


errorToString : Http.Error -> String
errorToString err =
    case err of
        Timeout ->
            "timeout"

        NetworkError ->
            "network problem"

        BadUrl _ ->
            "bad url"

        BadBody msg ->
            "Parsing error. " ++ msg

        BadStatus code ->
            "bad response code " ++ String.fromInt code

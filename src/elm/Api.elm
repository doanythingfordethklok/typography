module Api exposing (loadGifs)

import Http
import Json.Decode exposing (Decoder, andThen, at, int, list, string, succeed)
import Json.Decode.Pipeline exposing (required)
import Models exposing (GifImage)
import Url.Builder exposing (crossOrigin)


decodeThumbnail : Decoder String
decodeThumbnail =
    at [ "downsized", "url" ] string


decodeGifImage : Decoder GifImage
decodeGifImage =
    succeed GifImage
        |> required "title" (string |> andThen (\s -> succeed (String.split " " s)))
        |> required "images" decodeThumbnail
        |> required "url" string


loadGifs : String -> (Result Http.Error (List GifImage) -> msg) -> Cmd msg
loadGifs query msg =
    Http.request
        { method = "GET"
        , headers = []
        , url =
            crossOrigin "http://api.giphy.com"
                [ "v1", "gifs", "search" ]
                [ Url.Builder.string "api_key" "jPi87bOaQMzZslf13iv8rjI6ngRSV4r0"
                , Url.Builder.string "q" query
                , Url.Builder.int "offset" 0
                , Url.Builder.int "limit" 9
                , Url.Builder.string "lang" "en"
                , Url.Builder.string "rating" "PG-13"
                ]
        , body = Http.emptyBody
        , expect = Http.expectJson msg (at [ "data" ] (list decodeGifImage))
        , timeout = Nothing
        , tracker = Nothing
        }

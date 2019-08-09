module Main exposing (main)

import Api
import Browser exposing (element)
import Html exposing (Html, a, div, h1, h2, img, li, p, text, ul)
import Html.Attributes exposing (class, href, src)
import Http
import Json.Decode as Decode
import Markdown
import Markdown.Config exposing (HtmlOption(..))
import Models exposing (GifImage, Section(..), TextContent, defaultSections)
import Snackbar exposing (Snackbar)
import Util exposing (errorToString)


type alias Model =
    { sections : List Section
    , snackbar : Snackbar Msg
    , readme : String
    }


type Msg
    = GifsLoaded (Result Http.Error (List GifImage))
    | SnackMessage (Snackbar.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GifsLoaded result ->
            case result of
                Ok gifs ->
                    let
                        sections =
                            List.concat
                                [ List.take 2 model.sections
                                , [ Cards gifs ]
                                , List.drop 2 model.sections
                                ]

                        ( sb, cmd ) =
                            Snackbar.message Snackbar.DefaultDelay "Images successfully loaded from giphy"
                    in
                    ( { model | sections = sections, snackbar = sb }, Cmd.map SnackMessage cmd )

                Err e ->
                    let
                        ( sb, cmd ) =
                            Snackbar.message Snackbar.DefaultDelay (errorToString e)
                    in
                    ( { model | snackbar = sb }, Cmd.map SnackMessage cmd )

        SnackMessage submsg ->
            let
                ( sb, cmd ) =
                    Snackbar.update submsg model.snackbar
            in
            ( { model | snackbar = sb }, Cmd.map SnackMessage cmd )


init : Decode.Value -> ( Model, Cmd Msg )
init flags =
    case Decode.decodeValue Decode.string flags of
        Ok md ->
            ( { sections = defaultSections
              , snackbar = Snackbar.hidden
              , readme = md
              }
            , Api.loadGifs "idiocracy comacho" GifsLoaded
            )

        Err e ->
            let
                ( sb, cmd ) =
                    Snackbar.message Snackbar.DefaultDelay (Decode.errorToString e)
            in
            ( { sections = defaultSections
              , snackbar = sb
              , readme = ""
              }
            , Cmd.batch
                [ Cmd.map SnackMessage cmd
                , Api.loadGifs "idiocracy comacho" GifsLoaded
                ]
            )


viewCard : GifImage -> Html msg
viewCard gif =
    div [ class "card" ]
        [ div [ class "img" ] [ img [ src gif.thumbnail ] [] ]
        , div [ class "actions" ]
            [ a [ href gif.href ] [ text "View on giphy" ]
            ]
        ]


viewText : TextContent -> Html msg
viewText { heading, paragraphs, bullets } =
    div [ class "text" ]
        ([ [ h2 [] [ text heading ] ]
         , List.map (\ptext -> p [] [ text ptext ]) paragraphs
         , [ ul [] (List.map (\b -> li [] [ text b ]) bullets) ]
         ]
            |> List.concat
        )


viewSection : Section -> Html msg
viewSection section =
    case section of
        Text content ->
            viewText content

        Cards cards ->
            div []
                [ h2 [] [ text "List items" ]
                , div [ class "cards" ] (List.map viewCard cards)
                ]


view : Model -> Html Msg
view { sections, snackbar, readme } =
    div []
        [ div [ class "section" ] <|
            Markdown.toHtml (Just { softAsHardLineBreak = False, rawHtml = ParseUnsafe }) readme
        , div [ class "section" ]
            (List.map viewSection sections
                |> List.append [ Snackbar.view snackbar ]
            )
        ]


main : Program Decode.Value Model Msg
main =
    element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }

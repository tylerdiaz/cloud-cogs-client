module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html


main : Program Never
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- model


type alias Model =
    { quote : String
    }


init =
    ( Model "", Cmd.none )



-- update


type Msg
    = DoStuff


update msg model =
    case msg of
        DoStuff ->
            ( model, Cmd.none )



-- view


view model =
    div [ class "container" ] [ text "Hello world" ]

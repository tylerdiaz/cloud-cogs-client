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


type alias User =
    { username : String
    , email : String
    }


type alias Model =
    { user : Maybe User
    }


init =
    ( Model (Nothing), Cmd.none )



-- update


type Msg
    = DoStuff


update msg model =
    case msg of
        DoStuff ->
            ( model, Cmd.none )



-- view


annonymousHeaderView =
    header [ class "header" ]
        [ div [ class "container" ]
            [ nav [ class "nav" ]
                [ div [ class "nav-left" ]
                    [ a [ class "nav-item is-brand", href "#" ]
                        [ strong [] [ text "cloud-cogs" ] ]
                    ]
                , span [ class "nav-toggle" ] [ span [] [], span [] [], span [] [] ]
                , div [ class "nav-right nav-menu" ]
                    [ a [ class "nav-item", href "#" ] [ text "Login" ]
                    , a [ class "nav-item", href "#" ] [ text "Sign up" ]
                    ]
                ]
            ]
        ]


userHeaderView user =
    header [ class "header" ]
        [ div [ class "container" ]
            [ nav [ class "nav" ]
                [ div [ class "nav-left" ]
                    [ a [ class "nav-item is-brand", href "#" ]
                        [ strong [] [ text "cloud-cogs" ] ]
                    ]
                , span [ class "nav-toggle" ] [ span [] [], span [] [], span [] [] ]
                , div [ class "nav-right nav-menu" ]
                    [ a [ class "nav-item", href "#" ] [ text "Logout" ]
                    , span [ class "nav-item" ] [ text user.email ]
                    ]
                ]
            ]
        ]


view model =
    let
        header =
            case model.user of
                Nothing ->
                    annonymousHeaderView

                Just user ->
                    userHeaderView user
    in
        div [ class "container" ]
            [ header
            , div [ class "columns" ]
                [ div [ class "column is-three-quarters" ]
                    [ p [ class "" ]
                        [ text "main map" ]
                    ]
                , div [ class "column" ]
                    [ p [ class "" ]
                        [ text "Your avatar info" ]
                    ]
                ]
            ]

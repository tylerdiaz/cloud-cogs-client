module Header.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (Msg(NavigateTo))
import App.Routes exposing (reverse, Route(..))


navigationItem currentRoute destinationRoute contentHtml =
    let
        activeClass =
            if currentRoute == destinationRoute then
                "is-active"
            else
                ""
    in
        a
            [ class ("nav-item is-tab " ++ activeClass)
            , onClick (NavigateTo (reverse destinationRoute))
            ]
            contentHtml


headerNavigation user route =
    case user of
        Just user ->
            div [ class "nav-left" ]
                [ navigationItem route MainRoute [ img [ src "/images/logo-stamp.png" ] [] ]
                , navigationItem route AboutRoute [ text "About" ]
                ]

        Nothing ->
            div [ class "nav-left" ]
                [ a [ class "nav-item is-tab is-active" ] [ text "Cloud Cogs" ]
                ]


rootView userModel route =
    header [ class "header" ]
        [ nav [ class "nav has-shadow" ]
            [ div [ class "container" ] [ headerNavigation userModel route ] ]
        ]

module App.View exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (..)
import App.Routes exposing (Route(..))
import User.Types
import LandingPage.View


headerNavigation user =
    case user of
        Just user ->
            div [ class "nav-left" ]
                [ a [ class "nav-item is-tab is-active", onClick (NavigateTo "/") ] [ text "Cloud Cogs" ]
                , a [ class "nav-item is-tab", onClick (NavigateTo "about") ] [ text "About" ]
                , a [ class "nav-item is-tab" ] [ text "Sign out" ]
                , a [ class "nav-item is-tab" ] [ text "Account" ]
                ]

        Nothing ->
            div [ class "nav-left" ]
                [ a [ class "nav-item is-tab is-active" ] [ text "Cloud Cogs" ]
                , a [ class "nav-item is-tab" ] [ text "Sign in" ]
                , a [ class "nav-item is-tab" ] [ text "Sign up" ]
                ]


layout model children =
    div []
        [ header [ class "header" ]
            [ nav [ class "nav has-shadow" ]
                [ div [ class "container" ] [ headerNavigation model.user ] ]
            ]
        , div [ class "container" ] children
        ]


loadingView =
    div [ class "spinner" ]
        [ div [ class "double-bounce1" ]
            []
        , div [ class "double-bounce2" ]
            []
        ]


pageView model =
    case model.route of
        MainRoute ->
            case model.user of
                Nothing ->
                    case model.initialLoading of
                        True ->
                            loadingView

                        False ->
                            Html.App.map LandingAction (LandingPage.View.rootView model.landingPage)

                Just user ->
                    layout model
                        [ div [] [ h2 [ class "title" ] [ text "signed in" ] ] ]

        AboutRoute ->
            layout model
                [ div []
                    [ h2 [ class "title" ] [ text "About" ] ]
                ]

        NotFoundRoute ->
            div [] [ h2 [ class "title" ] [ text "Not found" ] ]


rootView model =
    div [] [ pageView model ]

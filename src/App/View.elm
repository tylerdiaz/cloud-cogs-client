module App.View exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (..)
import App.Routes exposing (Route(..))
import User.Types
import LandingPage.View
import Header.View as Header
import Sidebar.View as SidebarView
import String


layout model children =
    div []
        [ Header.rootView model.user model.route
        , div [ class "container" ] [ children ]
        ]


loadingView =
    div [ class "spinner" ]
        [ div [ class "double-bounce1" ]
            []
        , div [ class "double-bounce2" ]
            []
        ]


dashboardView model =
    layout model
        (div [ class "columns" ]
            [ div [ class "column is-two-thirds" ] [ text "stuff happens in here" ]
            , div [ class "column " ] [ SidebarView.rootView model ]
            ]
        )


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
                    dashboardView model

        AboutRoute ->
            layout model
                (div [] [ h2 [ class "title" ] [ text "About" ], p [] [ text "nothing to talk about really..." ] ])

        NotFoundRoute ->
            div [] [ h2 [ class "title" ] [ text "Not found" ] ]


rootView model =
    div [] [ pageView model ]

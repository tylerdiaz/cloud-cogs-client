module LandingPage.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


rootView =
    div [ class "container landing-container" ]
        [ div [ class "columns" ]
            [ div [ class "column is-one-quarter" ]
                [ img [ src "/images/logo.png", width 180 ] []
                , p [ class "landing-description" ] [ text "You've wondered into something different. Life on the land has become too polluted, too contaminated. People getting sick. Can't live there anymore. This is your new home, an airship called 'Little Piston'. Come in, meet your new neighbors." ]
                , p [ class "landing-description" ] [ text "Currently in Alpha v0.1" ]
                ]
            , div [ class "column" ] [ text "Hello, stranger. / Been here before?" ]
            ]
        ]

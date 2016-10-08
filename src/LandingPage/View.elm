module LandingPage.View exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LandingPage.Login.View as LoginView
import LandingPage.Register.View as RegistrationView
import LandingPage.Types exposing (Msg(..))


rootView model =
    div [ class "landing-body" ]
        [ div [ class "container landing-container" ]
            [ div [ class "columns" ]
                [ div [ class "column is-one-quarter" ]
                    [ img [ src "/images/logo.png", width 180 ] []
                    , p [ class "landing-description" ] [ text "You've wondered into something different. Life on the land has become too polluted, too contaminated. People getting sick. Can't live there anymore. This is your new home, an airship called 'Little Piston'. Come in, meet your new neighbors." ]
                    , p [ class "landing-description" ] [ text "Currently in Alpha v0.1" ]
                    ]
                , div [ class "column is-offset-1" ]
                    [ Html.App.map RegisterAction (RegistrationView.rootView model.registerForm)
                    , Html.App.map LoginAction (LoginView.rootView model.loginForm)
                    ]
                ]
            ]
        ]

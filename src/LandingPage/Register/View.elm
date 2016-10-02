module LandingPage.Register.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


formInput inputLabel inputType =
    div []
        [ label [ class "label" ] [ text inputLabel ]
        , p [ class "control " ]
            [ input [ class "input", type' inputType ] []
            ]
        ]


rootView =
    div []
        [ h2 [] [ text "Hello stranger" ]
        , Html.form [ class "form" ]
            [ formInput "Desired username" "text"
            , formInput "Your email" "email"
            , formInput "Password" "password"
            , button [ class "button is-primary" ] [ text "Jump on board" ]
            ]
        ]

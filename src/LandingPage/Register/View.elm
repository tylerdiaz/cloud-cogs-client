module LandingPage.Register.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LandingPage.Register.Types as RegisterTypes


formInput inputLabel inputAttrs =
    div []
        [ label [ class "label" ] [ text inputLabel ]
        , p [ class "control " ]
            [ input ([ class "input" ] ++ inputAttrs) []
            ]
        ]


rootView model =
    div []
        [ h2 [] [ text "Hello stranger" ]
        , Html.form [ class "form" ]
            [ formInput "Desired username" [ type' "text", value model.usernameInput, onInput RegisterTypes.UpdateUsernameInput ]
            , formInput "Your Email" [ type' "email", value model.emailInput, onInput RegisterTypes.UpdateEmailInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput RegisterTypes.UpdatePasswordInput ]
            , button [ class "button is-primary" ] [ text "Jump on board" ]
            ]
        ]

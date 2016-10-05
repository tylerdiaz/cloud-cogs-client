module LandingPage.Login.View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (Msg(..))
import LandingPage.Login.Types as LoginTypes


formInput inputLabel inputAttrs =
    div []
        [ label [ class "label" ] [ text inputLabel ]
        , p [ class "control " ]
            [ input ([ class "input" ] ++ inputAttrs) []
            ]
        ]


rootView model =
    div []
        [ h2 [] [ text "Back again?" ]
        , Html.form [ class "form" ]
            [ formInput "Username" [ type' "text", value model.usernameInput, onInput LoginTypes.UpdateUsernameInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput LoginTypes.UpdatePasswordInput ]
            , button [ class "button is-primary" ] [ text "Wake up" ]
            ]
        ]

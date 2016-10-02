module LandingPage.Login.View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (Msg(..))
import LandingPage.Types as LandingTypes
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
            [ formInput "Username" [ type' "text", onInput LoginTypes.UsernameInput ]
            , formInput "Password" [ type' "password" ]
            , button [ class "button is-primary" ] [ text "Wake up" ]
            ]
        ]

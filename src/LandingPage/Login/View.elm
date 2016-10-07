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


renderError error =
    case error of
        Just errorText ->
            div [ class "notification is-warning" ] [ text errorText ]

        Nothing ->
            div [] []


rootView model =
    div []
        [ h2 [] [ text "Back again?" ]
        , renderError (model.error)
        , Html.form [ class "form", onSubmit LoginTypes.Submit ]
            [ formInput "Username" [ type' "text", value model.usernameInput, onInput LoginTypes.UpdateUsernameInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput LoginTypes.UpdatePasswordInput ]
            , button [ class "button is-primary" ] [ text "Wake up" ]
            ]
        ]

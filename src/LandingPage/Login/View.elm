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


formButton buttonLabel isLoading =
    let
        btnClass =
            if isLoading then
                "button is-primary is-loading is-disabled"
            else
                "button is-primary"
    in
        button [ class btnClass ] [ text buttonLabel ]


rootView model =
    div []
        [ h2 [] [ text "Back again?" ]
        , renderError (model.error)
        , Html.form [ class "form", onSubmit LoginTypes.Submit ]
            [ formInput "Username" [ type' "text", value model.usernameInput, onInput LoginTypes.UpdateUsernameInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput LoginTypes.UpdatePasswordInput ]
            , formButton "Regain consciousness" model.submitting
            ]
        ]

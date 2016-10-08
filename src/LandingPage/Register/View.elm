module LandingPage.Register.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import LandingPage.Register.Types as RegisterTypes
import FormHelpers exposing (formInput, renderError, formButton)


rootView model =
    div []
        [ h2 [] [ text "Hello stranger" ]
        , Html.form [ class "form", onSubmit RegisterTypes.Submit ]
            [ formInput "Desired username" [ type' "text", value model.usernameInput, onInput RegisterTypes.UpdateUsernameInput ]
            , formInput "Your Email" [ type' "email", value model.emailInput, onInput RegisterTypes.UpdateEmailInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput RegisterTypes.UpdatePasswordInput ]
            , formButton "Start journey" model.submitting
            ]
        ]

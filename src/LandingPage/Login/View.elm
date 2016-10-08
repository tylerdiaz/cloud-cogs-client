module LandingPage.Login.View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (Msg(..))
import LandingPage.Login.Types as LoginTypes
import FormHelpers exposing (formInput, renderError, formButton)


rootView model =
    div []
        [ h2 [] [ text "Back again?" ]
        , renderError (model.error) LoginTypes.ClearError
        , Html.form [ class "form", onSubmit LoginTypes.Submit ]
            [ formInput "Username" [ type' "text", value model.usernameInput, onInput LoginTypes.UpdateUsernameInput ]
            , formInput "Password" [ type' "password", value model.passwordInput, onInput LoginTypes.UpdatePasswordInput ]
            , formButton "Regain consciousness" model.submitting
            ]
        ]

module LandingPage.Login.State exposing (..)

import LandingPage.Login.Types exposing (..)
import LandingPage.Login.Api as LoginApi
import HttpBuilder


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , submitting = False
    , error = Nothing
    }


update msg model userModel =
    case msg of
        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, userModel, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, userModel, Cmd.none )

        Submit ->
            ( { model | submitting = True, error = Nothing }
            , userModel
            , LoginApi.postLoginForm model.usernameInput model.passwordInput
            )

        LoginSuccess response ->
            ( { model | submitting = False }, userModel, Cmd.none )

        LoginFailure httpError ->
            let
                errorMessage =
                    case httpError of
                        HttpBuilder.BadResponse err ->
                            err.data

                        _ ->
                            "Server is down. Try later."
            in
                ( { model | submitting = False, error = Just errorMessage }, userModel, Cmd.none )

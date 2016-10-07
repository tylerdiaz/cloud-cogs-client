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


update msg model =
    case msg of
        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, Cmd.none )

        Submit ->
            ( { model | submitting = True, error = Nothing }
            , LoginApi.postLoginForm model.usernameInput model.passwordInput
            )

        LoginSuccess response ->
            ( { model | submitting = False }, Cmd.none )

        LoginFailure httpError ->
            let
                errorMessage =
                    case httpError of
                        HttpBuilder.BadResponse err ->
                            err.data

                        _ ->
                            "Server is down. Try later."
            in
                ( { model | submitting = False, error = Just errorMessage }, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, Cmd.none )

module LandingPage.Login.State exposing (..)

import LandingPage.Login.Types exposing (..)
import LandingPage.Login.Api as LoginApi
import HttpBuilder
import Store


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , submitting = False
    , error = Nothing
    }


subscriptions model userModel =
    Sub.none


update msg model userModel =
    case msg of
        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, userModel, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, userModel, Cmd.none )

        ClearError ->
            ( { model | error = Nothing }, userModel, Cmd.none )

        Submit ->
            ( { model | submitting = True, error = Nothing }
            , userModel
            , LoginApi.postLoginForm model.usernameInput model.passwordInput
            )

        LoginSuccess response ->
            ( { model | submitting = False, error = Nothing }
            , Just response.data
            , Store.setStorage ( "jwtToken", response.data.jwt )
            )

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

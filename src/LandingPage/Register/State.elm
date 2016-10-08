module LandingPage.Register.State exposing (..)

import LandingPage.Register.Types exposing (..)
import HttpBuilder
import LandingPage.Register.Api as RegisterApi


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , emailInput = ""
    , submitting = False
    , errors = Nothing
    }


update msg model userModel =
    case msg of
        UpdateEmailInput val ->
            ( { model | emailInput = val }, userModel, Cmd.none )

        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, userModel, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, userModel, Cmd.none )

        Submit ->
            ( { model | submitting = True, errors = Nothing }
            , userModel
            , RegisterApi.postRegisterForm
                { username = model.usernameInput
                , password = model.passwordInput
                , email = model.emailInput
                }
            )

        ClearError ->
            ( { model | errors = Nothing }, userModel, Cmd.none )

        RegisterSuccess response ->
            ( { model | submitting = False, errors = Nothing }
            , Just response.data
            , Cmd.none
            )

        RegisterFailure httpError ->
            let
                errorMessages =
                    case httpError of
                        HttpBuilder.BadResponse err ->
                            Just err.data

                        _ ->
                            Nothing
            in
                ( { model | submitting = False, errors = errorMessages }, userModel, Cmd.none )

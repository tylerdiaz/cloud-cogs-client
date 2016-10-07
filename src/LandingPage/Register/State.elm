module LandingPage.Register.State exposing (..)

import LandingPage.Register.Types exposing (..)


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , emailInput = ""
    , submitting = False
    }


update msg model userModel =
    case msg of
        UpdateEmailInput val ->
            ( { model | emailInput = val }, userModel, Cmd.none )

        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, userModel, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, userModel, Cmd.none )

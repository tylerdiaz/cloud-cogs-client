module LandingPage.Register.State exposing (..)

import LandingPage.Register.Types exposing (..)


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , emailInput = ""
    , submitting = False
    }


update msg model =
    case msg of
        UpdateEmailInput val ->
            ( { model | emailInput = val }, Cmd.none )

        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, Cmd.none )

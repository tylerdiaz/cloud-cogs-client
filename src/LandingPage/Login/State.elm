module LandingPage.Login.State exposing (..)

import LandingPage.Login.Types exposing (..)


initialState =
    { usernameInput = ""
    , passwordInput = ""
    , submitting = False
    }


update msg model =
    case msg of
        UpdateUsernameInput val ->
            ( { model | usernameInput = val }, Cmd.none )

        UpdatePasswordInput val ->
            ( { model | passwordInput = val }, Cmd.none )

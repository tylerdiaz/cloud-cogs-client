module LandingPage.State exposing (..)

import LandingPage.Types exposing (..)
import LandingPage.Login.State as LoginState


initialState =
    { loginForm = LoginState.initialState
    }


update msg model =
    case msg of
        LoginAction action ->
            let
                ( newLogin, effects ) =
                    LoginState.update action model.loginForm
            in
                ( { model | loginForm = newLogin }, Cmd.none )

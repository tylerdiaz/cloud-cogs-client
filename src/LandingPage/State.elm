module LandingPage.State exposing (..)

import LandingPage.Types exposing (..)
import LandingPage.Login.State as LoginState
import LandingPage.Register.State as RegisterState


initialState =
    { loginForm = LoginState.initialState
    , registerForm = RegisterState.initialState
    }


update msg model =
    case msg of
        LoginAction action ->
            let
                ( newLogin, effects ) =
                    LoginState.update action model.loginForm
            in
                ( { model | loginForm = newLogin }, Cmd.map LoginAction effects )

        RegisterAction action ->
            let
                ( newForm, effects ) =
                    RegisterState.update action model.registerForm
            in
                ( { model | registerForm = newForm }, Cmd.map RegisterAction effects )

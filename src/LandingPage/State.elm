module LandingPage.State exposing (..)

import LandingPage.Types exposing (..)
import LandingPage.Login.State as LoginState
import LandingPage.Register.State as RegisterState


initialState =
    { loginForm = LoginState.initialState
    , registerForm = RegisterState.initialState
    }


update msg model userModel =
    case msg of
        LoginAction action ->
            let
                ( newLogin, newUser, effects ) =
                    LoginState.update
                        action
                        model.loginForm
                        userModel
            in
                ( { model | loginForm = newLogin }, newUser, Cmd.map LoginAction effects )

        RegisterAction action ->
            let
                ( newForm, newUser, effects ) =
                    RegisterState.update
                        action
                        model.registerForm
                        userModel
            in
                ( { model | registerForm = newForm }, newUser, Cmd.map RegisterAction effects )

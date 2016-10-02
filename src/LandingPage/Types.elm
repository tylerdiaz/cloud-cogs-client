module LandingPage.Types exposing (..)

import LandingPage.Login.Types as LoginTypes
import LandingPage.Register.Types as RegisterTypes


type alias Model =
    { loginForm : LoginTypes.Model, registerForm : RegisterTypes.Model }


type Msg
    = LoginAction LoginTypes.Msg
    | RegisterAction RegisterTypes.Msg

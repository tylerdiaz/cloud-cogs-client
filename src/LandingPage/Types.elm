module LandingPage.Types exposing (..)

import LandingPage.Login.Types as LoginTypes exposing (Model, Msg(..))


type alias Model =
    { login : LoginTypes.Model }


type Msg
    = LoginAction LoginTypes.Msg

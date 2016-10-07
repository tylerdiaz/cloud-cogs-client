module LandingPage.Login.Types exposing (..)

import HttpBuilder
import User.Types as UserTypes


type alias Model =
    { usernameInput : String
    , passwordInput : String
    , submitting : Bool
    , error : Maybe String
    }


type Msg
    = UpdateUsernameInput String
    | UpdatePasswordInput String
    | Submit
    | LoginSuccess (HttpBuilder.Response UserTypes.User)
    | LoginFailure (HttpBuilder.Error String)

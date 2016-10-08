module LandingPage.Register.Types exposing (..)

import User.Types as UserTypes
import HttpBuilder
import Dict


type alias Model =
    { usernameInput : String
    , emailInput : String
    , passwordInput : String
    , submitting : Bool
    , errors : Maybe Dict.Dict String (List String)
    }


type Msg
    = UpdateUsernameInput String
    | UpdatePasswordInput String
    | UpdateEmailInput String
    | ClearError
    | Submit
    | RegisterSuccess (HttpBuilder.Response UserTypes.User)
    | RegisterFailure (HttpBuilder.Error (Dict.Dict String (List String)))

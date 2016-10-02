module LandingPage.Register.Types exposing (..)


type alias Model =
    { usernameInput : String
    , emailInput : String
    , passwordInput : String
    , submitting : Bool
    }


type Msg
    = UpdateUsernameInput String
    | UpdatePasswordInput String
    | UpdateEmailInput String

module LandingPage.Login.Types exposing (..)


type alias Model =
    { usernameInput : String
    , passwordInput : String
    , submitting : Bool
    }


type Msg
    = UsernameInput String
    | PasswordInput String

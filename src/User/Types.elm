module User.Types exposing (..)


type alias User =
    { username : String
    , email : String
    }


type Msg
    = DoStuff

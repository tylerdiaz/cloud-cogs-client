module User.Types exposing (..)


type alias User =
    { id : Int
    , username : String
    , jwt : String
    }

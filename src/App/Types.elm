module App.Types exposing (..)

import Hop.Types exposing (Config, Address, Query)
import App.Routes exposing (Route(..))


type alias User =
    { username : String
    , email : String
    }


type alias Model =
    { user : Maybe User
    , address : Address
    , route : Route
    }


type Msg
    = DoStuff
    | NavigateTo String

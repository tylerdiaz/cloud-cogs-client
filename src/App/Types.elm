module App.Types exposing (..)

import Hop.Types exposing (Config, Address, Query)
import App.Routes exposing (Route(..))
import User.Types exposing (User)


type alias Model =
    { user : Maybe User
    , address : Address
    , route : Route
    }


type Msg
    = NavigateTo String
    | UserAction User.Types.Msg

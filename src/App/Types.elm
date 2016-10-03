module App.Types exposing (..)

import Hop.Types exposing (Config, Address, Query)
import App.Routes exposing (Route(..))
import User.Types exposing (User)
import LandingPage.Types as LandingTypes


type alias Model =
    { user : Maybe User
    , landingPage : LandingTypes.Model
    , address : Address
    , route : Route
    }


type Msg
    = NavigateTo String
    | LandingAction LandingTypes.Msg

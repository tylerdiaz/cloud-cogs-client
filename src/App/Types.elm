module App.Types exposing (..)

import Hop.Types exposing (Config, Address, Query)
import App.Routes exposing (Route(..))
import User.Types exposing (User)
import LandingPage.Types as LandingTypes
import HttpBuilder


type alias Model =
    { user : Maybe User
    , landingPage : LandingTypes.Model
    , address : Address
    , route : Route
    , initialLoading : Bool
    }


type alias Flags =
    { jwtToken : Maybe String }


type Msg
    = NavigateTo String
    | LandingAction LandingTypes.Msg
    | SetUser (HttpBuilder.Response User)
    | LoadingUser
    | DeadResponse (HttpBuilder.Error String)

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
    }


type alias Flags =
    { jwtToken : Maybe String }


type Msg
    = NavigateTo String
    | LandingAction LandingTypes.Msg
    | StorageValue ( String, Maybe String )
    | RetrieveValue String
    | StoreValue ( String, String )
    | SetUser (HttpBuilder.Response User)
    | DeadResponse (HttpBuilder.Error String)

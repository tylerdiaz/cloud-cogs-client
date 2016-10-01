module App.State exposing (..)

import App.Types exposing (..)
import Dict
import Navigation
import Hop
import App.Routes exposing (Route(NotFoundRoute), routes)
import UrlParser exposing (parse)
import User.State


initialState ( route, address ) =
    ( { address = address
      , route = route
      , user = User.State.initialState
      }
    , Cmd.none
    )


subscriptions _ =
    Sub.none


hopConfig =
    { hash = False, basePath = "" }


urlUpdate ( route, address ) model =
    ( { model | route = route, address = address }, Cmd.none )


urlParser =
    let
        parse path =
            path
                |> UrlParser.parse identity routes
                |> Result.withDefault NotFoundRoute

        resolver =
            Hop.makeResolver hopConfig parse
    in
        Navigation.makeParser (.href >> resolver)


update msg model =
    case msg of
        UserAction action ->
            let
                ( newUser, effects ) =
                    User.State.update action model.user
            in
                ( { model | user = Just newUser }, Cmd.none )

        NavigateTo path ->
            let
                command =
                    Hop.outputFromPath hopConfig path
                        |> Navigation.newUrl
            in
                ( model, command )

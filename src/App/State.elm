module App.State exposing (..)

import App.Types exposing (..)
import App.Api as Api
import Dict
import Navigation
import Hop
import App.Routes exposing (Route(NotFoundRoute), routes)
import UrlParser exposing (parse)
import User.State
import LandingPage.State
import Store


initialState { jwtToken } ( route, address ) =
    ( { address = address
      , route = route
      , landingPage = LandingPage.State.initialState
      , user = User.State.initialState
      }
    , Api.retrieveUser jwtToken
    )


subscriptions model =
    Store.storageValue StorageValue


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
        -- Landing page can affect the user (login/signup) so we include it
        LandingAction action ->
            let
                ( newLandingPage, newUser, effects ) =
                    LandingPage.State.update
                        action
                        model.landingPage
                        model.user
            in
                ( { model | landingPage = newLandingPage, user = newUser }, Cmd.map LandingAction effects )

        NavigateTo path ->
            let
                command =
                    Hop.outputFromPath hopConfig path
                        |> Navigation.newUrl
            in
                ( model, command )

        StorageValue ( key, value ) ->
            -- set it in da model
            case value of
                Nothing ->
                    ( model, Cmd.none )

                Just val ->
                    ( model, Cmd.none )

        StoreValue ( key, val ) ->
            ( model, Store.setStorage ( key, val ) )

        RetrieveValue key ->
            ( model, Store.getStorage key )

        SetUser userModel ->
            ( { model | user = Just userModel.data }, Cmd.none )

        DeadResponse txt ->
            ( model, Cmd.none )

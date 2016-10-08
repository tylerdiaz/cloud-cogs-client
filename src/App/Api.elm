module App.Api exposing (..)

import ApiHelpers exposing (postJson)
import App.Config exposing (apiUrl)
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import App.Types exposing (Msg(DeadResponse, SetUser))
import Task
import HttpBuilder exposing (jsonReader, stringReader)
import User.Types as UserTypes


userDecoder =
    "user"
        := Decode.object3
            UserTypes.User
            ("id" := Decode.int)
            ("username" := Decode.string)
            ("jwt" := Decode.string)


requestCurrentUser jwtToken =
    HttpBuilder.get (apiUrl ++ "current_user")
        |> HttpBuilder.withHeader "content-type" "application/json"
        |> HttpBuilder.withHeader "authorization" jwtToken
        |> HttpBuilder.send (jsonReader userDecoder) (stringReader)


retrieveUser jwtToken =
    case jwtToken of
        Nothing ->
            Cmd.none

        Just token ->
            Task.perform DeadResponse SetUser (requestCurrentUser token)

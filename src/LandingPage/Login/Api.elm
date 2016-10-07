module LandingPage.Login.Api exposing (..)

import Debug
import Task exposing (Task)
import Time
import App.Config exposing (apiUrl)
import HttpBuilder exposing (..)
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import User.Types as UserTypes
import LandingPage.Login.Types exposing (Msg(..))
import App.Types exposing (Msg(LandingAction))
import LandingPage.Types exposing (Msg(LoginAction))


loginErrorDecoder =
    ("error" := Decode.string)


userDecoder =
    Decode.object2
        UserTypes.User
        ("id" := Decode.int)
        ("name" := Decode.string)


loginFormEncoder username password =
    Encode.object
        [ ( "session"
          , Encode.object
                [ ( "username", Encode.string username )
                , ( "password", Encode.string password )
                ]
          )
        ]


postLoginForm username password =
    let
        request =
            HttpBuilder.post (apiUrl ++ "sessions")
                |> withJsonBody (loginFormEncoder username password)
                |> HttpBuilder.withHeader "content-type" "application/json"
                |> HttpBuilder.send (jsonReader userDecoder) (jsonReader loginErrorDecoder)
    in
        Task.perform LoginFailure LoginSuccess request

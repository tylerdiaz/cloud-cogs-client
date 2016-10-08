module LandingPage.Login.Api exposing (..)

import ApiHelpers exposing (postJson)
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import App.Types exposing (Msg(LandingAction))
import User.Types as UserTypes
import LandingPage.Types exposing (Msg(LoginAction))
import LandingPage.Login.Types exposing (Msg(LoginFailure, LoginSuccess))


loginErrorDecoder =
    "error" := Decode.string


userDecoder =
    "user"
        := Decode.object3
            UserTypes.User
            ("id" := Decode.int)
            ("username" := Decode.string)
            ("jwt" := Decode.string)


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
    postJson
        "sessions"
        (loginFormEncoder username password)
        ( loginErrorDecoder, LoginFailure )
        ( userDecoder, LoginSuccess )

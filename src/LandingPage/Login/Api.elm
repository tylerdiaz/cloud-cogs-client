module LandingPage.Login.Api exposing (..)

import Time
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import User.Types as UserTypes
import LandingPage.Login.Types exposing (Msg(..))
import App.Types exposing (Msg(LandingAction))
import LandingPage.Types exposing (Msg(LoginAction))
import ApiHelpers exposing (postJson)


loginErrorDecoder =
    "error" := Decode.string


userDecoder =
    "user"
        := Decode.object3
            UserTypes.User
            ("id" := Decode.int)
            ("jwt" := Decode.string)
            ("username" := Decode.string)


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

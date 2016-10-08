module LandingPage.Register.Api exposing (..)

import ApiHelpers exposing (postJson)
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import App.Types exposing (Msg(LandingAction))
import User.Types as UserTypes
import LandingPage.Types exposing (Msg(RegisterAction))
import LandingPage.Register.Types exposing (Msg(RegisterFailure, RegisterSuccess))


registerErrorDecoder =
    "errors" := Decode.dict (Decode.list Decode.string)


userDecoder =
    "user"
        := Decode.object3
            UserTypes.User
            ("id" := Decode.int)
            ("jwt" := Decode.string)
            ("username" := Decode.string)


registerFormEncoder formFields =
    Encode.object
        [ ( "user"
          , Encode.object
                [ ( "username", Encode.string formFields.username )
                , ( "email", Encode.string formFields.email )
                , ( "password", Encode.string formFields.password )
                ]
          )
        ]


postRegisterForm formFields =
    postJson
        "users"
        (registerFormEncoder formFields)
        ( registerErrorDecoder, RegisterFailure )
        ( userDecoder, RegisterSuccess )

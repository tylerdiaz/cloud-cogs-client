module ApiHelpers exposing (..)

import HttpBuilder exposing (..)
import App.Config exposing (apiUrl)
import Task exposing (Task)
import Json.Decode as Decode
import Json.Encode as Encode


postJson : String -> Encode.Value -> ( Decode.Decoder b, Error b -> c ) -> ( Decode.Decoder d, Response d -> c ) -> Cmd c
postJson path body ( failureParser, failureAction ) ( successParser, successAction ) =
    let
        request =
            HttpBuilder.post (apiUrl ++ path)
                |> withJsonBody body
                |> HttpBuilder.withHeader "content-type" "application/json"
                |> HttpBuilder.send (jsonReader successParser) (jsonReader failureParser)
    in
        Task.perform failureAction successAction request

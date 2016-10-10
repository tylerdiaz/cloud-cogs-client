port module Store exposing (..)

-- speak


port getStorage : String -> Cmd msg


port removeStorage : String -> Cmd msg


port setStorage : ( String, String ) -> Cmd msg



-- listen


port storageValue : (( String, Maybe String ) -> msg) -> Sub msg

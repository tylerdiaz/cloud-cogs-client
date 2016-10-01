module User.State exposing (..)

import User.Types exposing (..)


initialState =
    -- (Just { username = "one", email = "person@asd.com" })
    Nothing


update msg model =
    case msg of
        DoStuff ->
            case model of
                Just model ->
                    ( { model | username = "user1", email = "user1@gmail.com" }, Cmd.none )

                Nothing ->
                    ( { username = "user2", email = "user2@gmail.com" }, Cmd.none )

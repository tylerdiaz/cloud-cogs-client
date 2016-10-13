module GameNarrative.State exposing (..)

import GameNarrative.Types exposing (..)

initialState = {}

update msg model =
    case msg of
        ActionName ->
          ( model, Cmd.none )

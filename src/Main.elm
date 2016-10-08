module Main exposing (..)

import Navigation exposing (program)
import App.State
import App.View
import App.Types exposing (Flags)


main : Program Flags
main =
    Navigation.programWithFlags App.State.urlParser
        { init = App.State.initialState
        , update = App.State.update
        , urlUpdate = App.State.urlUpdate
        , subscriptions = App.State.subscriptions
        , view = App.View.rootView
        }

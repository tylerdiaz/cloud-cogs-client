module App.Routes exposing (..)

import UrlParser exposing (oneOf, format, s, (</>))


{-
   Route here is a type but I feel it
   makes more sense to have in this file
   than the usual Types file.
-}


type Route
    = AboutRoute
    | MainRoute
    | NotFoundRoute


matchers =
    [ format MainRoute (s "")
    , format AboutRoute (s "about")
    ]


reverse : Route -> String
reverse route =
    case route of
        MainRoute ->
            ""

        AboutRoute ->
            "about"

        NotFoundRoute ->
            ""


routes =
    oneOf matchers

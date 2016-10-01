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


routes =
    oneOf matchers

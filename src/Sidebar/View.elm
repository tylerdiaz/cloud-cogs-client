module Sidebar.View exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)


userCardView model =
    div [ class "sidebar-module" ]
        [ h4 [] [ text "Your overview" ]
        , ul []
            [ li [] [ text "Name: pixeltweak" ]
            , li [] [ text "Area: Little Piston, 2nd floor" ]
            , li [] [ text "Credits: 120" ]
            , li [] [ text "Energy: 90/100" ]
            ]
        ]


locationsView model =
    div [ class "sidebar-module discovered-locations" ]
        [ h4 [] [ text "Discovered locations" ]
        , ul []
            [ li [] [ text "Library", a [ href "#", class "travel-link is-small" ] [ text "visit" ] ]
            , li [] [ text "Bank", a [ href "#", class "travel-link is-small" ] [ text "visit" ] ]
            ]
        ]


inventoryView model =
    div [ class "sidebar-module" ]
        [ h4 [] [ text "Inventory" ]
        , ul []
            [ li [] [ text "Wrench x2" ]
            , li [] [ text "Baseball x4" ]
            ]
        ]


rootView model =
    div [ class "content" ]
        [ userCardView model
        , inventoryView model
        , locationsView model
        ]

module Sidebar.View exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)


rootView gameModel =
    div [ class "content" ]
        [ userCardView gameModel
        , inventoryView gameModel.inventory
        , locationsView gameModel.discoveredLocations
        ]



-- Your overview


userCardView { location, character } =
    div [ class "sidebar-module" ]
        [ h4 [] [ text "Your overview" ]
        , ul []
            [ li [] [ text "Name: pixeltweak" ]
            , li [] [ text ("Area: " ++ location.area) ]
            , li [] [ text ("Credits: " ++ (toString character.credits)) ]
            , li [] [ text ("Energy: " ++ (toString character.energy) ++ "/" ++ (toString character.max_energy)) ]
            ]
        ]



-- Inventory


itemView { id, name, quantity } =
    let
        quantityText =
            if quantity > 1 then
                " x" ++ (toString quantity)
            else
                ""
    in
        li [] [ text (name ++ quantityText) ]


inventoryView inventoryModel =
    div [ class "sidebar-module" ]
        [ h4 [] [ text "Inventory" ]
        , ul [] (List.map itemView inventoryModel)
        ]



-- Discovered Locations


discoveredLocation { id, name } =
    li [] [ text name, a [ href "#", class "travel-link is-small" ] [ text "visit" ] ]


locationsView locationsModel =
    div [ class "sidebar-module discovered-locations" ]
        [ h4 [] [ text "Discovered locations" ]
        , ul [] (List.map discoveredLocation locationsModel)
        ]

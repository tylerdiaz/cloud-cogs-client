module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (..)
import App.Routes exposing (Route(..))


pageView model =
    case model.route of
        MainRoute ->
            div []
                [ button [ onClick (NavigateTo "about") ] [ text "About" ] ]

        AboutRoute ->
            div [] [ h2 [ class "title" ] [ text "About" ] ]

        NotFoundRoute ->
            div [] [ h2 [ class "title" ] [ text "Not found" ] ]


rootView model =
    div [] [ pageView model ]

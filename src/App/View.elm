module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Types exposing (..)
import App.Routes exposing (Route(..))
import User.Types


pageView model =
    case model.route of
        MainRoute ->
            let
                email =
                    case model.user of
                        Just user ->
                            user.email

                        Nothing ->
                            "anonymous"
            in
                div []
                    [ button [ onClick (NavigateTo "about") ] [ text "About" ]
                    , button [ onClick (UserAction User.Types.DoStuff) ] [ text "Transform" ]
                    , span [] [ text email ]
                    ]

        AboutRoute ->
            div [] [ h2 [ class "title" ] [ text "About" ] ]

        NotFoundRoute ->
            div [] [ h2 [ class "title" ] [ text "Not found" ] ]


rootView model =
    div [] [ pageView model ]

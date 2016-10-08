module FormHelpers exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


formInput inputLabel inputAttrs =
    div []
        [ label [ class "label" ] [ text inputLabel ]
        , p [ class "control " ]
            [ input ([ class "input" ] ++ inputAttrs) []
            ]
        ]


renderError error clearError =
    case error of
        Just errorText ->
            div [ class "notification is-warning" ]
                [ button [ class "delete", onClick clearError ] []
                , text errorText
                ]

        Nothing ->
            div [] []


formButton buttonLabel isLoading =
    let
        btnClass =
            if isLoading then
                "button is-primary is-loading is-disabled"
            else
                "button is-primary"
    in
        button [ class btnClass ] [ text buttonLabel ]

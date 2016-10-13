module GameNarrative.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameNarrative.Types exposing (..)


rootView gameModel =
    div [ class "box" ]
        [ narrativeView gameModel.narrative
        , hr [] []
        , dialogueView gameModel.dialogue
        , hr [] []
        , actionablesView gameModel.actionables
        ]



-- Actionables


actionableOption { label, id } =
    button [ class "level-item button" ] [ text label ]


actionableView { title, subtitle, description, image, options } =
    article [ class "media" ]
        [ div [ class "media-left" ]
            [ figure [ class "image is-64x64" ] [ img [ alt "Image", src image ] [] ] ]
        , div [ class "media-content" ]
            [ div [ class "content" ]
                [ p []
                    [ strong [] [ text title ]
                    , small [] [ text subtitle ]
                    , p [] [ text description ]
                    ]
                ]
            , nav [ class "level" ]
                [ div [ class "level-left" ] (List.map actionableOption options) ]
            ]
        ]


actionablesView actionablesModel =
    div []
        [ div [ class "" ] (List.map actionableView actionablesModel) ]



-- Dialogue


dialogueOption { label, id } =
    button [ class "button" ] [ text label ]


dialogueTranscript transcriptText =
    li [] [ text transcriptText ]


dialogueView dialogueModel =
    div [ class "dialogue-view columns" ]
        [ div [ class "dialogue-image column is-one-quarter" ]
            [ img [ src dialogueModel.image ] [] ]
        , div [ class "dialogue-messages column" ]
            [ ul [] (List.map dialogueTranscript dialogueModel.transcript)
            , div [ class "dialogue-options" ]
                [ div [ class "dialogue-options-label" ] [ text "Your options:" ]
                , div [] (List.map dialogueOption dialogueModel.options)
                ]
            ]
        ]



-- Narrative


narrativeOption { label, id } =
    button [ class "button is-medium" ] [ text label ]


narrativeTranscript transcriptText =
    li [] [ text transcriptText ]


narrativeView narrativeModel =
    div [ class "narrative-view" ]
        [ ul [] (List.map narrativeTranscript narrativeModel.transcript)
        , div [ class "narrative-options" ] (List.map narrativeOption narrativeModel.options)
        ]

module Game.State exposing (..)

import Game.Types exposing (..)


initialState =
    { character =
        { credits = 120, energy = 75, max_energy = 120 }
    , inventory =
        [ { id = "uuid3"
          , name = "Wrench"
          , description = "Unlodge stuff with it"
          , itemType = QuestItem
          , quantity = 2
          , thumbnail = "/images/items/"
          }
        , { id = "uuid4"
          , name = "Small copper cog"
          , description = "It moves parts inside a machine"
          , itemType = MiscItem
          , quantity = 11
          , thumbnail = "/images/items/"
          }
        ]
    , location =
        { id = "uuid"
        , name = "Sleeping Quarters"
        , image = "/images/locations/sleeping_quarters.jpg"
        , area = "Little Piston, 3rd floor"
        }
    , discoveredLocations =
        [ { id = "uuid"
          , name = "Sleeping Quarters"
          , image = "/images/locations/sleeping_quarters.jpg"
          , area = "Little Piston, 3rd floor"
          }
        , { id = "uuid2"
          , name = "Library"
          , image = "/images/locations/sleeping_quarters.jpg"
          , area = "Little Piston, 3rd floor"
          }
        ]
    , actionables =
        [ { title = "A caped stranger"
          , subtitle = "Stranger"
          , image = "http://placehold.it/150x150"
          , description = "A strange man holds a staff and stares at you."
          , options =
                [ { label = "Sit up", id = "uuid9" }
                , { label = "Lie in bed", id = "uuid9" }
                ]
          }
        ]
    , dialogue =
        { transcript = [ "Air is cool, engines hum.", "Daylight strains through windows into the room.", "Your eyes open." ]
        , image = "http://placehold.it/150x150"
        , options =
            [ { label = "Sit up", id = "uuid9" }
            , { label = "Lie in bed", id = "uuid9" }
            ]
        }
    , narrative =
        { transcript = [ "Air is cool, engines hum.", "Daylight strains through windows into the room.", "Your eyes open." ]
        , options =
            [ { label = "Sit up", id = "uuid9" }
            , { label = "Lie in bed", id = "uuid9" }
            ]
        }
    }


update msg model =
    case msg of
        ActionName ->
            ( model, Cmd.none )

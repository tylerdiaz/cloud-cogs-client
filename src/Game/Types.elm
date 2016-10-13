module Game.Types exposing (..)


type alias Location =
    { id : String
    , name : String
    , image : String
    , area : String
    }


type ItemType
    = QuestItem
    | MiscItem


type alias Item =
    { id : String
    , name : String
    , quantity : Int
    , thumbnail : String
    , description : String
    , itemType : ItemType
    }


type alias Option =
    { label : String
    , id : String
    }


type alias Narrative =
    { transcript : List String
    , options : List Option
    }


type alias Actionable =
    { title : String
    , subtitle : String
    , description : String
    , image : String
    , options : List Option
    }


type alias Dialogue =
    { transcript : List String
    , options : List Option
    , image : String
    }


type alias Model =
    { character : { credits : Int, energy : Int, max_energy : Int }
    , inventory : List Item
    , location : Location
    , discoveredLocations : List Location
    , narrative : Narrative
    , dialogue : Dialogue
    , actionables : Actionable
    }


type Msg
    = ActionName

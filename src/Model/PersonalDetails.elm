module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [] 
    [ h1 [id "name"] [text <| "Nume: " ++ details.name]
    , em [id "intro"] [text <| "Intro: " ++ details.intro]
    , div [class "contact-detail"] <| List.map (\{name, detail} -> text <| name ++ ": " ++ detail) details.contacts
    , div [class "social-link"] <| List.map (\{name, detail} -> a[href detail] [text name]) details.socials
    ]
    -- Debug.todo "Implement the Model.PersonalDetails.view function"
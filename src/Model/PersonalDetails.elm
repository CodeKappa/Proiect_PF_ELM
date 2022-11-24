module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href, style)
import Model.Util exposing (divStyle, pStyle)

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
    [ h1 [id "name", style "margin" "5px"] [text <| "Nume: " ++ details.name]
    , p [style "margin" "5px"] [em [id "intro"] [text <| "Intro: " ++ details.intro]]
    , div divStyle <| List.map (\{name, detail} -> p [class "contact-detail"] [text <| name ++ ": " ++ detail]) details.contacts
    , div divStyle <| List.map (\{name, detail} -> p [class "social-link"] [a [href detail] [text name]]) details.socials
    ]
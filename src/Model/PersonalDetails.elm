module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href, style)


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

dataStyle = [style "border" "solid 1px", style "margin" "2px"]

view : PersonalDetails -> Html msg
view details =
    div [style "line_space" "50px"] 
    [ h1 [id "name"] [text <| "Nume: " ++ details.name]
    , em [id "intro"] [text <| "Intro: " ++ details.intro]
    , div dataStyle <| List.map (\{name, detail} -> p [class "contact-detail"] [text <| name ++ ": " ++ detail]) details.contacts
    , div dataStyle <| List.map (\{name, detail} -> p [class "social-link"] [a [href detail] [text name]]) details.socials
    ]
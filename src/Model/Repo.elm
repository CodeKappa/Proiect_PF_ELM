module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De
import Maybe exposing (withDefault)
import Model.Util exposing (divStyle, pStyle)

type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }

view : Repo -> Html msg
view repo =
    div (divStyle ++ [class "repo"]) 
    [ p (pStyle ++ [class "repo-name"]) [text <| "Name: " ++ repo.name]
    , p (pStyle ++ [class "repo-description"]) [Maybe.map text repo.description |> withDefault (text "")]
    , p (pStyle ++ [class "repo-url"]) [a [href repo.url] [text repo.url]]
    , p (pStyle ++ [class "repo-stars"]) [text <| "Stars: " ++ String.fromInt repo.stars]
    ]


sortByStars : List Repo -> List Repo
sortByStars repos =
    List.sortBy .stars repos


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
    De.map5 Repo 
        (De.field "name" De.string)
        (De.field "description" De.string |> De.maybe)
        (De.field "html_url" De.string)
        (De.field "pushed_at" De.string)
        (De.field "stargazers_count" De.int)
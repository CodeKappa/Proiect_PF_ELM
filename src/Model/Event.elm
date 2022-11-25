module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href, style)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)
import Maybe exposing (map, withDefault)
import Model.Util exposing (divStyle, pStyle)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    events |> List.sortWith (\a b -> Interval.compare a.interval b.interval)


view : Event -> Html Never
view event =
    div (divStyle ++ [classList [("event", True), ("event-important", event.important)]])
    [ p (pStyle ++ [class "event-title"]) [text event.title]
    , p (pStyle ++ [class "event-description"]) [event.description]
    , p (pStyle ++ [class "event-url"]) [event.url |> Maybe.map (\url -> a[href url][text url]) |> withDefault (text "")]
    , p [style "margin" "5px", class "event-category"] [categoryView event.category]
    , p (pStyle ++ [class "event-interval"]) [Interval.view event.interval]
    ]
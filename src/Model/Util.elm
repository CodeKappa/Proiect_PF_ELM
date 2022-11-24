module Model.Util exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

{-| Chains two `Order`s. It first checks the second parameter:

  - if it's `EQ`, then it returns the first parameter
  - otherise it returns it as is.

Meant to be used with the pipeline operator:

-}
chainCompare : Order -> Order -> Order
chainCompare ord2 ord1 =
    case ord1 of
        EQ ->
            ord2

        other ->
            other

divStyle : List (Attribute msg)
divStyle = [style "border" "solid 1px", style "margin" "2px"]

pStyle : List (Attribute msg)
pStyle = [style "margin" "2px"]
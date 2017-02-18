module View exposing (..)

import ContactList.View exposing (indexView)
import Html exposing (..)
import Messages exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    section []
        [ headerView
        , div [] [ indexView model ]
        ]


headerView : Html Msg
headerView =
    header []
        [ h1 [] [ text "Phonix & Elm" ] ]

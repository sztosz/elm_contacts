module View exposing (..)

import ContactList.View exposing (indexView)
import Contact.View exposing (showContactView)
import Common.View exposing (..)
import Html exposing (..)
import Messages exposing (..)
import Model exposing (..)
import Routing exposing (..)


view : Model -> Html Msg
view model =
    section
        []
        [ headerView
        , div
            []
            [ page model ]
        ]


headerView : Html Msg
headerView =
    header []
        [ h1 [] [ text "Phonix & Elm" ] ]

page : Model -> Html Msg
page model =
    case model.route of
        HomeIndexRoute ->
            indexView model

        ShowContactRoute id ->
            showContactView model

        NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    warningMessage
        "fa fa-meh-o fa-stack-x2"
        "Page not found"
        backToHomeLink

module ContactList.View exposing (..)

import Contact.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)


indexView : Model -> Html Msg
indexView model =
    div
        [ id "home_index" ]
        [ div
            []
            [ p [] [ text (toString model.error) ]
            , contactList model
            ]
        ]


contactList : Model -> Html Msg
contactList model =
    if model.contactList.total_entries > 0 then
        model.contactList.entries
            |> List.map contactView
            |> div [ class "cards-wrapper" ]
    else
        let
            classes =
                classList [ ( "warning", True ) ]
        in
            div
                [ classes ]
                [ span
                    [ class "fa-stack" ]
                    [ i [ class "fa fa-meh-o fa-stack-x2" ] [] ]
                , h4
                    []
                    [ text "No Contacts found..." ]
                ]

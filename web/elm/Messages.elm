module Messages exposing (..)

import Http
import Model exposing (ContactList, Contact)
import Navigation
import Routing exposing (Route)
import Json.Encode as JE


type Msg
    = FetchContactListSuccess JE.Value
    | FetchContactListError JE.Value
    | FetchContactSuccess JE.Value
    | FetchContactError JE.Value
    | Paginate Int
    | HandleSearchInput String
    | HandleFormSubmit
    | ResetSearch
    | UrlChange Navigation.Location
    | NavigateTo Route

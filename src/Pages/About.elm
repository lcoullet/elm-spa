module Pages.About exposing (Model, Msg, page)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Region as Region
import Generated.Params as Params
import Spa.Page
import Utils.Spa exposing (Page)


type alias Model =
    ()


type alias Msg =
    Never


page : Page Params.About Model Msg model msg appMsg
page =
    Spa.Page.static
        { title = always "A propos"
        , view = view
        }



-- VIEW


view : Utils.Spa.PageContext -> Element Msg
view { global } =
    column
        [ spacing 24
        , case global.device.class of
            Phone ->
                paddingXY 12 24

            Tablet ->
                paddingXY 64 24

            Desktop ->
                paddingXY 128 64

            BigDesktop ->
                paddingXY 230 64
        ]
        [ el [ Region.heading 1, Font.size 32 ] (text "A propos")
        , Element.paragraph [] [ text "Salut les amis, comment ça va ? " ]
        , Element.paragraph [] [ text "Moi ça va bien et vous ?" ]
        ]

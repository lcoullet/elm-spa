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
        (case global.device.class of
            Phone ->
                [ paddingXY 8 24
                , width (fill |> maximum 320)
                , centerX
                ]

            Tablet ->
                [ paddingXY 16 24
                , width (fill |> maximum 640)
                , centerX
                ]

            Desktop ->
                [ paddingXY 32 64
                , centerX
                , width (fill |> maximum 800)
                ]

            BigDesktop ->
                [ paddingXY 64 64, centerX, width (fill |> maximum 800) ]
        )
        [ el [ Region.heading 1, Font.size 24 ] (text "A propos")
        , Element.paragraph [ Font.size 16 ] [ text "Salut les amis, comment ça va ? " ]
        , Element.paragraph [ Font.size 16 ] [ text "Moi ça va bien et vous ?" ]
        ]

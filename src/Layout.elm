module Layout exposing (view)

import Element exposing (..)
import Element.Font as Font
import Generated.Routes as Routes exposing (Route, routes)
import Utils.Spa as Spa


respState : DeviceClass -> Element msg
respState dev =
    Element.el [ Font.size 12 ]
        (case dev of
            Phone ->
                text "Phone"

            Desktop ->
                text "Desktop"

            Tablet ->
                text "Tablet"

            BigDesktop ->
                text "Big Desktop"
        )


view : Spa.LayoutContext msg -> Element msg
view { page, route, global } =
    column [ height fill, width fill ]
        [ viewHeader route
        , page
        , respState global.device.class
        ]


viewHeader : Route -> Element msg
viewHeader currentRoute =
    row
        [ spacing 24
        , paddingEach { top = 32, left = 16, right = 16, bottom = 0 }
        , centerX
        , width (fill |> maximum 480)
        ]
        [ viewLink currentRoute ( "home", routes.top )
        , viewLink currentRoute ( "nowhere", routes.notFound )
        , viewLink currentRoute ( "about", routes.about )
        ]


viewLink : Route -> ( String, Route ) -> Element msg
viewLink currentRoute ( label, route ) =
    if currentRoute == route then
        el
            [ Font.underline
            , Font.color (rgb255 204 75 75)
            , alpha 0.5
            , Font.size 16
            ]
            (text label)

    else
        link
            [ Font.underline
            , Font.color (rgb255 204 75 75)
            , Font.size 16
            , mouseOver [ alpha 0.5 ]
            ]
            { label = text label
            , url = Routes.toPath route
            }

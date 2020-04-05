module Generated.Route exposing
    ( Route(..)
    , toPath
    )

import Generated.Params as Params


type Route
    = About Params.About
    | NotFound Params.NotFound
    | Top Params.Top


toPath : Route -> String
toPath route =
    case route of
        About _ ->
            "/about"
        
        
        NotFound _ ->
            "/not-found"
        
        
        Top _ ->
            "/"
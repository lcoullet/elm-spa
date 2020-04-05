module Generated.Routes exposing
    ( Route
    , parsers
    , routes
    , toPath
    )

import Generated.Route
import Url.Parser as Parser exposing ((</>), Parser, map, s, string, top)



-- ALIASES


type alias Route =
    Generated.Route.Route


toPath : Route -> String
toPath =
    Generated.Route.toPath



-- ROUTES


type alias Routes =
    { about : Route
    , notFound : Route
    , top : Route
    }


routes : Routes
routes =
    { about =
        Generated.Route.About {}
    , notFound =
        Generated.Route.NotFound {}
    , top =
        Generated.Route.Top {}
    }
 

parsers : List (Parser (Route -> a) a)
parsers =
    [ map routes.about
        (s "about")
    , map routes.notFound
        (s "not-found")
    , map routes.top
        (top)
    ]
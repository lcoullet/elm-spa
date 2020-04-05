module Generated.Pages exposing
    ( Model
    , Msg
    , page
    , path
    )

import Spa.Page
import Spa.Path exposing (Path, static, dynamic)
import Layout as Layout
import Utils.Spa as Spa
import Generated.Params as Params
import Generated.Route as Route exposing (Route)
import Pages.About
import Pages.NotFound
import Pages.Top




type Model
    = AboutModel Pages.About.Model
    | NotFoundModel Pages.NotFound.Model
    | TopModel Pages.Top.Model


type Msg
    = AboutMsg Pages.About.Msg
    | NotFoundMsg Pages.NotFound.Msg
    | TopMsg Pages.Top.Msg


page : Spa.Page Route Model Msg layoutModel layoutMsg appMsg
page =
    Spa.layout
        { path = path
        , view = Layout.view
        , recipe =
            { init = init
            , update = update
            , bundle = bundle
            }
        }


path : Path
path =
    []


-- RECIPES


type alias Recipe flags model msg appMsg =
    Spa.Recipe flags model msg Model Msg appMsg


type alias Recipes msg =
    { about : Recipe Params.About Pages.About.Model Pages.About.Msg msg
    , notFound : Recipe Params.NotFound Pages.NotFound.Model Pages.NotFound.Msg msg
    , top : Recipe Params.Top Pages.Top.Model Pages.Top.Msg msg
    }


recipes : Recipes msg
recipes =
    { about =
        Spa.recipe
            { page = Pages.About.page
            , toModel = AboutModel
            , toMsg = AboutMsg
            }
    , notFound =
        Spa.recipe
            { page = Pages.NotFound.page
            , toModel = NotFoundModel
            , toMsg = NotFoundMsg
            }
    , top =
        Spa.recipe
            { page = Pages.Top.page
            , toModel = TopModel
            , toMsg = TopMsg
            }
    }



-- INIT


init : Route -> Spa.Init Model Msg
init route_ =
    case route_ of
        Route.About params ->
            recipes.about.init params
        
        Route.NotFound params ->
            recipes.notFound.init params
        
        Route.Top params ->
            recipes.top.init params



-- UPDATE


update : Msg -> Model -> Spa.Update Model Msg
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( AboutMsg msg, AboutModel model ) ->
            recipes.about.update msg model
        
        ( NotFoundMsg msg, NotFoundModel model ) ->
            recipes.notFound.update msg model
        
        ( TopMsg msg, TopModel model ) ->
            recipes.top.update msg model
        _ ->
            Spa.Page.keep bigModel


-- BUNDLE


bundle : Model -> Spa.Bundle Msg msg
bundle bigModel =
    case bigModel of
        AboutModel model ->
            recipes.about.bundle model
        
        NotFoundModel model ->
            recipes.notFound.bundle model
        
        TopModel model ->
            recipes.top.bundle model
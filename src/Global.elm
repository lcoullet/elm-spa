module Global exposing
    ( Flags
    , Model
    , Msg(..)
    , init
    , subscriptions
    , update
    )

import Browser.Events exposing (onResize)
import Element exposing (Device, classifyDevice)
import Generated.Routes as Routes exposing (Route)
import Ports


type alias Flags =
    { width : Int
    , height : Int
    }


type alias Model =
    { device : Device
    }


type Msg
    = DeviceClassified Device


type alias Commands msg =
    { navigate : Route -> Cmd msg
    }


init : Commands msg -> Flags -> ( Model, Cmd Msg, Cmd msg )
init _ flags =
    ( { device = Element.classifyDevice flags }
    , Cmd.none
    , Ports.log "Hello!"
    )


update : Commands msg -> Msg -> Model -> ( Model, Cmd Msg, Cmd msg )
update _ msg model =
    case msg of
        DeviceClassified device ->
            ( { model | device = device }
            , Cmd.none
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    onResize <|
        \width height ->
            DeviceClassified (Element.classifyDevice { width = width, height = height })

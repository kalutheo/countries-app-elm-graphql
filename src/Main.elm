module Main exposing (Model(..), Msg(..), init, main, subscriptions, update, view)

import Api.AllContinents as ApiAllContinents exposing (AllContinents)
import Api.SingleContinent as ApiSingleContinent exposing (Continent)
import Browser
import Graphql.Http
import Html exposing (Html, pre, text)
import Http



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , ApiSingleContinent.makeRequest GotSingleContinent
    )



-- UPDATE


type Msg
    = GotText (Result Http.Error String)
    | GotSingleContinent (Result (Graphql.Http.Error (Maybe Continent)) (Maybe Continent))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( Success fullText, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )

        GotSingleContinent (Ok response) ->
            let
                _ =
                    Debug.log "Response OK " response
            in
            ( model, Cmd.none )

        GotSingleContinent (Err err) ->
            let
                _ =
                    Debug.log "Response Err" err
            in
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "I was unable to load your book."

        Loading ->
            text "Loading..."

        Success fullText ->
            pre [] [ text fullText ]

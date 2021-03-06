-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Countries.Object.Country exposing (code, continent, currency, emoji, emojiU, languages, name, native, phone)

import Countries.InputObject
import Countries.Interface
import Countries.Object
import Countries.Scalar
import Countries.ScalarDecoders
import Countries.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| -}
code : SelectionSet (Maybe String) Countries.Object.Country
code =
    Object.selectionForField "(Maybe String)" "code" [] (Decode.string |> Decode.nullable)


{-| -}
name : SelectionSet (Maybe String) Countries.Object.Country
name =
    Object.selectionForField "(Maybe String)" "name" [] (Decode.string |> Decode.nullable)


{-| -}
native : SelectionSet (Maybe String) Countries.Object.Country
native =
    Object.selectionForField "(Maybe String)" "native" [] (Decode.string |> Decode.nullable)


{-| -}
phone : SelectionSet (Maybe String) Countries.Object.Country
phone =
    Object.selectionForField "(Maybe String)" "phone" [] (Decode.string |> Decode.nullable)


{-| -}
continent : SelectionSet decodesTo Countries.Object.Continent -> SelectionSet (Maybe decodesTo) Countries.Object.Country
continent object_ =
    Object.selectionForCompositeField "continent" [] object_ (identity >> Decode.nullable)


{-| -}
currency : SelectionSet (Maybe String) Countries.Object.Country
currency =
    Object.selectionForField "(Maybe String)" "currency" [] (Decode.string |> Decode.nullable)


{-| -}
languages : SelectionSet decodesTo Countries.Object.Language -> SelectionSet (Maybe (List (Maybe decodesTo))) Countries.Object.Country
languages object_ =
    Object.selectionForCompositeField "languages" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| -}
emoji : SelectionSet (Maybe String) Countries.Object.Country
emoji =
    Object.selectionForField "(Maybe String)" "emoji" [] (Decode.string |> Decode.nullable)


{-| -}
emojiU : SelectionSet (Maybe String) Countries.Object.Country
emojiU =
    Object.selectionForField "(Maybe String)" "emojiU" [] (Decode.string |> Decode.nullable)

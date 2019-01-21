module Api.AllContinents exposing (AllContinents, makeRequest)

import Countries.Object.Continent as Continent
import Countries.Query as Query
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import RemoteData exposing (RemoteData)



{--
query {
  continents {
    name
  }
}

--}


type alias Continent =
    { name : Maybe String
    }


type alias AllContinents =
    List (Maybe Continent)


query : SelectionSet (Maybe AllContinents) RootQuery
query =
    Query.continents
        continentSelection


continentSelection =
    SelectionSet.map Continent
        Continent.name


makeRequest :
    (Result (Graphql.Http.Error (Maybe AllContinents)) (Maybe AllContinents) -> msg)
    -> Cmd msg
makeRequest toMsg =
    query
        |> Graphql.Http.queryRequest "https://countries.trevorblades.com"
        |> Graphql.Http.send toMsg

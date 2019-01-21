module Api.SingleContinent exposing (Continent, makeRequest)

import Countries.Object.Continent as Continent
import Countries.Query as Query
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import RemoteData exposing (RemoteData)



{--
query {
  continent(code: "AF") {
    name
  }
}

--}


type alias Continent =
    { name : Maybe String
    }


query : SelectionSet (Maybe Continent) RootQuery
query =
    Query.continent
        (\optionals ->
            { optionals | code = Present "AF" }
        )
        continentSelection


continentSelection =
    SelectionSet.map Continent
        Continent.name


makeRequest :
    (Result (Graphql.Http.Error (Maybe Continent)) (Maybe Continent) -> msg)
    -> Cmd msg
makeRequest toMsg =
    query
        |> Graphql.Http.queryRequest "https://countries.trevorblades.com"
        |> Graphql.Http.send toMsg

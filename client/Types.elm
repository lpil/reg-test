module Types exposing (..)

import Http


type Msg
    = PatternChange String
    | ModifiersChange String
    | SubjectChange String
    | NewResults (Result Http.Error RegexResult)


type RequestStatus
    = NoRequest
    | AwaitingResult
    | AwaitingResultWithQueue


type alias Model =
    { regexEndpoint : String
    , queryStatus : RequestStatus
    , pattern : String
    , modifiers : String
    , subject : String
    , results : Maybe RegexResult
    }


type alias Flags =
    { regexEndpoint : String
    }


type RegexResult
    = OkResult (List SubjectResult)
    | ErrResult (List ErrorResultDetail)


type alias RegexIndex =
    { start : Int
    , length : Int
    }


type alias SubjectResult =
    { subject : String
    , binaries : List String
    , indexes : List RegexIndex
    }


type alias ErrorResultDetail =
    { message : String
    , position : Int
    }

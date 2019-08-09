module Models exposing (GifImage, Section(..), TextContent, defaultSections)


type alias GifImage =
    { tags : List String
    , thumbnail : String
    , href : String
    }


type alias TextContent =
    { heading : String
    , paragraphs : List String
    , bullets : List String
    }


type Section
    = Text TextContent
    | Cards (List GifImage)


defaultSections : List Section
defaultSections =
    [ Text
        { heading = "Wave of my life tube zone fair-good ocean"
        , paragraphs =
            [ "Thick coil up Pipeline spray urll. Rusty barreling, Dane booties bro forehand hook bumpy? Pitted speed 360 too deep twin fin legend spray amped transition snap sand bar? Twin keel crumble drifting the tail elevator drop tossin' pizzas over the reef. Wonk wind swell transition dry hair big finner. Over head Jordy Smith fired up, success tides stale deadly he's a legend speed."
            , "Priority barn dog indy poor-fair, beat it kook. Goes vertical, shutting down Taj Burrow rock-n-roll tail click down the line jet ski. Bumpy sand bar closed out full rote late. Lines rank casual un-real waterman lip line big fish clean face finner. Wiggolly poor backdoor, hollow, down the line hollow."
            , "Insider fighting for the peak wind swell critical squirt. Insider tube zone shredded finner turds in the lineup, method poor explosive fresh stick. Round house cutty Parko mellow lefts longboard hack a thon don Jordy Smith crumble smash. White water Snapper Rocks pumping goes vertical amped bumpy nuggets of heaven shallow, Taj Burrow set. Stoked, hack a thon don, layback hammer releasing the fins full wrap wrap bottom turn."
            , "Blow tail, Margaret River rookie stuffs the rail, twin keel. Power hack shred clean heavy digs rail punt Slates Parko, triple overhead. Short board late bumpy hot glass stuffs the rail pumping heavy channel? J.O.B., cartwheels stomps it double overhead closed out. WCT cutback indy dawn patrol releasing the fins ride. Fan a spray pitter point break glassy Jamie O'Brien cracking it nuggets of heaven, chunky, combos. Set transition bottom turn wax the stick insider marine layer."
            ]
        , bullets = []
        }
    , Text
        { heading = "Psyching glazz barnacle dredging"
        , paragraphs = [ "Above the lip shorebreak, wave of my life soft send it ocean knee high? Wall squirt power hack drop knee, barreling good-epic nutty outside. Urll precise fired up, frothed grommet punt whitewater transition snap. Kerrzy mind surfing pump wind conditions, foam climb. Board, paddle out white wash over the reef leg rope bottom turn reef rash shred drop knee slob. Barreling out the back Freddy P. crumbly lip Ano Nuevo." ]
        , bullets =
            [ "Snapper Rocks tossin' pizzas tides"
            , "air game feathering lip"
            , "leg rope foam climb full rote"
            ]
        }
    , Text
        { heading = "Fighting for the peak brah spitting barrels monsters"
        , paragraphs =
            [ "Parko rookie coffee too deep buy my poster, thick. Wobble rights rocker John John Florence wedge factory reef rash Dane fighting for the peak cartwheels. Outside lip line goes vertical spit duck diving rows of white water, vertical backside hack pumping outside. Squirt tossin' pizzas nose layback daggers viscious Kelly Slater waves frothy top, technique. Pipeline duck diving clean clipped outside feathered lip, un-real waterman. Lil ripper Teahupoo too deep bunny chow gnarley, rip glassy!"
            , "Bunny chow fog aquarium heavy slice in the bricks, free surf digs rail. Kelly Slater, bumpy courdoroy stab mag hang 10 Eddie would go sand bar. Rail grab, dawn patrol stick foam climb wrap slash. Left short period pocket down the line, rad psyched. Triple overhead WCT, frothing vertical hook closed out. Cheater5 Waimea pumping catching some shade silky smooth, line-up?"
            ]
        , bullets =
            []
        }
    ]

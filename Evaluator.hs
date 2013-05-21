module Evaluator where 

import Data.List

isOk t = not $ any (\w -> w `isInfixOf` t) badWords

badWords = [
  "anus",
  "arse",
  "arsehole",
  "asshole",
  "axe-wound",
  "axewound",
  "bastard",
  "basterd",
  "bastird",
  "blow job",
  "blow-job",
  "blowjob",
  "bollocks",
  "boner",
  "chuckies",
  "chuftie",
  "cluster fuck",
  "clusterfuck",
  "crap",
  "crotch",
  "cum",
  "cunnifungus",
  "cunt",
  "cunt struck",
  "cuntstruck",
  "dick head",
  "dickhead",
  "dildo",
  "effin",
  "effin bastard",
  "effin'",
  "effinbastard",
  "fadge",
  "fart",
  "flatulence",
  "fuck",
  "fuck face",
  "fuck head",
  "fuck-wit",
  "fucker",
  "fuckface",
  "fuckhead",
  "fuckin'",
  "fucking",
  "fucking cunt",
  "fuckingcunt",
  "fuckwit",
  "fud",
  "fukc",
  "fukc face",
  "fukc head",
  "fukcface",
  "fukchead",
  "fukcin'",
  "fukcing",
  "furgle",
  "gamahuche",
  "gang bang",
  "gang-bang",
  "gangbang",
  "gash",
  "gazoo",
  "glory hole",
  "glory-hole",
  "gloryhole",
  "gob job",
  "gob shite",
  "gob-job",
  "gob-shite",
  "gobjob",
  "gobshite",
  "gut grunt",
  "gut-grunt",
  "gutgrunt",
  "ham shank",
  "ham-shank",
  "hamshank",
  "hand job",
  "hand solo",
  "hand-job",
  "hand-shandy",
  "hand-solo",
  "handjob",
  "handshandy",
  "handsolo",
  "hard on",
  "hard-on",
  "hardon",
  "have it off",
  "have-it-off",
  "haveitoff",
  "hooker",
  "hootchie",
  "horny",
  "hose job",
  "hose monster",
  "hose-job",
  "hose-monster",
  "hosejob",
  "hosemonster",
  "hump",
  "J Arthur",
  "J-Arthur",
  "jack off",
  "jack-off",
  "jack-shit",
  "jackoff",
  "jackshit",
  "jackshit",
  "jam raid",
  "jam-rag",
  "jam-raid",
  "jamrag",
  "jamraid",
  "JArthur",
  "jer koff",
  "jerk",
  "jerk-off",
  "jerkoff",
  "jism",
  "jit-gel",
  "jitgel",
  "jizz",
  "jizz bags",
  "jizz jar",
  "jizz-jar",
  "jizzbags",
  "jizzjar",
  "kak",
  "kazoo",
  "kife",
  "kling-ons",
  "klingons",
  "labia-lard",
  "labialard",
  "langer",
  "leg over",
  "leg-over",
  "legover",
  "lezza",
  "lingam",
  "lobcock",
  "love juice",
  "love palace",
  "love sausage",
  "love torpedo",
  "love truncheon",
  "love tunnel",
  "love-juice",
  "love-palace",
  "love-sausage",
  "love-socket",
  "love-torpedo",
  "love-truncheon",
  "love-tunnel",
  "lovejuice",
  "lovepalace",
  "lovesausage",
  "lovesocket",
  "lovesocket",
  "lovespuds",
  "lovetorpedo",
  "lovetruncheon",
  "lovetunnel",
  "manfat",
  "man fat",
  "mapatasi",
  "mezoomas",
  "middle leg",
  "middle-leg",
  "middleleg",
  "minge",
  "motha fucka",
  "motha fukers",
  "mothafika",
  "mothafucka",
  "mothafukers",
  "mother fucker",
  "motherfucker",
  "Mr Sausage",
  "Mr-Sausage",
  "MrSausage",
  "muff",
  "muff-diver",
  "muff-huffmuffhuff",
  "muffdiver",
  "muffdiver",
  "nob",
  "nookey",
  "nymph",
  "nympho",
  "onanism",
  "one-eyed",
  "oneeyed",
  "orgasm",
  "penis",
  "piss",
  "poe",
  "poof",
  "prick",
  "puke",
  "pussy",
  "putz",
  "pyro flatulate",
  "pyroflatulate",
  "ram job",
  "ram-job",
  "ramjob",
  "razzle",
  "rectal",
  "schlong",
  "schmeckie",
  "shag",
  "shagable",
  "shit",
  "shit faced",
  "shit head",
  "shit-faced",
  "shite",
  "shitfaced",
  "shithead",
  "shits",
  "shtup",
  "spadger",
  "spasm chasm",
  "spasm-chasm",
  "spasmchasm",
  "sperm",
  "spla water",
  "spla-water",
  "splawater",
  "spunk",
  "spunkslam-spunk",
  "suck hole",
  "suck-offsuckoff",
  "suckhole",
  "sun of a bitch",
  "sunofabitch",
  "tadger",
  "third leg",
  "third-leg",
  "thirdleg",
  "tit",
  "tit-man",
  "tit-wank",
  "titman",
  "tit man",
  "titty fuck",
  "titty-fuck",
  "tittyfuck",
  "tongue job",
  "tongue-job",
  "tongue-shui",
  "tonguejob",
  "tongueshui",
  "tongueshui",
  "tonk",
  "topless relief",
  "topless-relief",
  "toplessrelief",
  "trouser snake",
  "trouser tent",
  "trouser-snake",
  "trouser-tent",
  "trousersnake",
  "trousertent",
  "turd",
  "twat",
  "vag",
  "vagina",
  "vagitarian",
  "vulva",
  "wab",
  "wank",
  "wanker",
  "wanking",
  "wap wap sweenie",
  "wap waps",
  "wap-waps",
  "wapwapsweenie",
  "whanger",
  "wide on",
  "wide-on",
  "wideon",
  "yarbles",
  "yongles",
  "zig a zig",
  "zig-a-zig",
  "zipper sniffer",
  "zipper-sniffer",
  "zippersniffer"]
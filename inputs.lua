--
-- Created by IntelliJ IDEA.
-- User: scott
-- Date: 8/1/2017
-- Time: 11:14 AM
-- To change this template use File | Settings | File Templates.
--

input_mapper = {
    {
        {  406, {"A"}}, -- Skip intro
        {  476, {"A"}}, -- Title screen
        {  530, {"Down"}}, -- Highlight OPTIONS
        {  534, {"A"}}, -- Select OPTIONS
        {  564, {"Left"}}, -- Fast text
        {  567, {"Down"}}, -- Battle Scene
        {  570, {"Left"}}, -- Off
        {  573, {"Down"}}, -- Battle Style
        {  576, {"Left"}}, -- Set
        {  579, {"B"}}, -- Confirm

        -- This is the input that signals your ID to generate.
        {  game_start_frame, {"A"}}, -- NEW GAME (644)
    },
    {
        {  112, {"Down"}}, -- Hover over girl
        {  116, {"A"}}, -- I'm a girl
        {  259, {"A"}}, -- ..........................................
        {  313, {"A"}}, -- Zzz... Hm? Wha...? You woke
        -- me up!
        {  370, {"A"}}, -- Will you check the clock for
        -- me?
        {  401, {"Up"}}, -- DAY 10 o'clock
        {  407, {"Up"}}, -- DAY 11 o'clock
        {  413, {"Up"}}, -- DAY 12 o'clock
        {  419, {"Up"}}, -- DAY 1 o'clock
        {  425, {"Up"}}, -- DAY 2 o'clock
        {  431, {"Up"}}, -- DAY 3 o'clock
        {  437, {"Up"}}, -- DAY 4 o'clock
        {  443, {"A"}}, -- DAY 5 o'clock
        {  473, {"A"}}, -- Confirm hour
        {  525, {"Down"}}, -- 0 min.
        {  531, {"Down"}}, -- 59 min.
        {  537, {"Down"}}, -- 58 min.
        {  543, {"Down"}}, -- 57 min.
        {  549, {"Down"}}, -- 56 min.
        {  555, {"Down"}}, -- 55 min.
        {  561, {"Down"}}, -- 54 min.
        {  567, {"Down"}}, -- 53 min.
        {  573, {"Down"}}, -- 52 min.
        {  579, {"Down"}}, -- 51 min.
        {  585, {"A"}}, -- 50 min.
        {  609, {"A"}}, -- Confirm minute.
        {  656, {"A"}}, -- DAY 5:50! Yikes I over-
        {  674, {"A"}}, -- slept!
        {  888, {"A"}}, -- Hello! Sorry to keep you waiting!
        {  945, {"A"}}, -- Welcome to the world of #MON!
        {  986, {"A"}}, -- My name is OAK.
        { 1043, {"A"}}, -- People call me the #MON PROF.
        { 1144, {"A"}}, -- This world is in-habited by crea-
        { 1178, {"A"}}, -- tures that we call
        { 1238, {"A"}}, -- #MON.
        { 1282, {"A"}}, -- People and #MON live together by
        { 1329, {"A"}}, -- supporting each other.
        { 1389, {"A"}}, -- Some people play with #MON, some
        { 1422, {"A"}}, -- battle with them.
        { 1572, {"A"}}, -- But we don't know everything about
        { 1600, {"A"}}, -- #MON yet.
        { 1657, {"A"}}, -- There are still many mysteries to
        { 1679, {"A"}}, -- solve.
        { 1739, {"A"}}, -- That's why I study #MON every day.
        { 1882, {"A"}}, -- Now, what did you say your name was?
        { 1933, {"A"}}, -- NEW NAME
        { 1959, {"A"}}, -- A
        { 1963, {"Start"}}, -- END
        { 1967, {"A"}}, -- Confirm
        { 2068, {"A"}}, -- A, are you ready?
        { 2123, {"A"}}, -- Your very own #MON story is
        { 2155, {"A"}}, -- about to unfold.
        { 2210, {"A"}}, -- You'll face fun times and tough
        { 2237, {"A"}}, -- challenges.
        { 2294, {"A"}}, -- A world of dreams and adventures
        { 2348, {"A"}}, -- awaits! Let's go!
    },
}

--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:659601c29931679e4ca20d3513767e82:a04db1c95e55ca8dcc2aa0beb71e98d2:f5c322b4188998d6cd973301e8657e5f$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- bird_1
            x=750,
            y=638,
            width=127,
            height=62,

        },
        {
            -- bird_2
            x=621,
            y=609,
            width=127,
            height=62,

        },
        {
            -- bird_green
            x=906,
            y=561,
            width=71,
            height=38,

        },
        {
            -- bird_green_flying_1
            x=912,
            y=519,
            width=75,
            height=40,

        },
        {
            -- bird_green_flying_2
            x=912,
            y=477,
            width=75,
            height=40,

        },
        {
            -- bird_green_flying_3
            x=912,
            y=519,
            width=75,
            height=40,

        },
        {
            -- bird_green_flying_4
            x=912,
            y=477,
            width=75,
            height=40,

        },
        {
            -- bird_green_flying_5
            x=912,
            y=519,
            width=75,
            height=40,

        },
        {
            -- bird_green_flying_6
            x=912,
            y=435,
            width=75,
            height=40,

        },
        {
            -- button_about-over
            x=621,
            y=701,
            width=98,
            height=26,

        },
        {
            -- button_about
            x=879,
            y=669,
            width=100,
            height=29,

        },
        {
            -- button_back-over
            x=621,
            y=673,
            width=98,
            height=26,

        },
        {
            -- button_back
            x=879,
            y=638,
            width=100,
            height=29,

        },
        {
            -- button_start-over
            x=879,
            y=700,
            width=98,
            height=26,

        },
        {
            -- button_start
            x=784,
            y=607,
            width=100,
            height=29,

        },
        {
            -- cloud_large
            x=621,
            y=541,
            width=161,
            height=66,

        },
        {
            -- cloud_small
            x=912,
            y=367,
            width=89,
            height=66,

        },
        {
            -- coin
            x=584,
            y=541,
            width=23,
            height=32,

        },
        {
            -- coin32
            x=989,
            y=435,
            width=12,
            height=16,

        },
        {
            -- coin_brown
            x=584,
            y=575,
            width=22,
            height=32,

        },
        {
            -- derpy_bird_logo
            x=394,
            y=868,
            width=218,
            height=107,

        },
        {
            -- game_over_box
            x=324,
            y=561,
            width=258,
            height=305,

        },
        {
            -- game_over_title
            x=394,
            y=977,
            width=225,
            height=38,

        },
        {
            -- ground
            x=2,
            y=292,
            width=1000,
            height=73,

        },
        {
            -- heart_empty
            x=979,
            y=583,
            width=19,
            height=20,

        },
        {
            -- heart_full
            x=979,
            y=561,
            width=19,
            height=20,

        },
        {
            -- mountains
            x=2,
            y=2,
            width=1000,
            height=288,

        },
        {
            -- ring
            x=324,
            y=868,
            width=68,
            height=143,

        },
        {
            -- ring_brown
            x=906,
            y=601,
            width=17,
            height=35,

        },
        {
            -- start_background
            x=2,
            y=541,
            width=320,
            height=480,

        },
        {
            -- start_bird
            x=784,
            y=541,
            width=120,
            height=64,

        },
        {
            -- trees
            x=2,
            y=367,
            width=908,
            height=172,

        },
    },
    
    sheetContentWidth = 1004,
    sheetContentHeight = 1023
}

SheetInfo.frameIndex =
{

    ["bird_1"] = 1,
    ["bird_2"] = 2,
    ["bird_green"] = 3,
    ["bird_green_flying_1"] = 4,
    ["bird_green_flying_2"] = 5,
    ["bird_green_flying_3"] = 6,
    ["bird_green_flying_4"] = 7,
    ["bird_green_flying_5"] = 8,
    ["bird_green_flying_6"] = 9,
    ["button_about-over"] = 10,
    ["button_about"] = 11,
    ["button_back-over"] = 12,
    ["button_back"] = 13,
    ["button_start-over"] = 14,
    ["button_start"] = 15,
    ["cloud_large"] = 16,
    ["cloud_small"] = 17,
    ["coin"] = 18,
    ["coin32"] = 19,
    ["coin_brown"] = 20,
    ["derpy_bird_logo"] = 21,
    ["game_over_box"] = 22,
    ["game_over_title"] = 23,
    ["ground"] = 24,
    ["heart_empty"] = 25,
    ["heart_full"] = 26,
    ["mountains"] = 27,
    ["ring"] = 28,
    ["ring_brown"] = 29,
    ["background_blue_green"] = 30,
    ["start_bird"] = 31,
    ["trees"] = 32,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

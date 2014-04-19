--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:84f55aa0b564575b9b918770c2840029:5954b1899c22d5bd162481b3bfe2d706:f5c322b4188998d6cd973301e8657e5f$
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
            -- StartPage_New
            x=324,
            y=541,
            width=320,
            height=480,

        },
        {
            -- bird_green
            x=912,
            y=435,
            width=71,
            height=38,

        },
        {
            -- button_about
            x=809,
            y=717,
            width=100,
            height=29,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 29
        },
        {
            -- button_start
            x=809,
            y=686,
            width=100,
            height=29,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 29
        },
        {
            -- cloud_large
            x=646,
            y=650,
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
            x=866,
            y=541,
            width=23,
            height=32,

        },
        {
            -- derpy_bird_logo
            x=646,
            y=541,
            width=218,
            height=107,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 218,
            sourceHeight = 107
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
            x=982,
            y=497,
            width=19,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 19,
            sourceHeight = 20
        },
        {
            -- heart_full
            x=982,
            y=475,
            width=19,
            height=20,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 19,
            sourceHeight = 20
        },
        {
            -- mountains
            x=2,
            y=2,
            width=1000,
            height=288,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1000,
            sourceHeight = 288
        },
        {
            -- ring
            x=912,
            y=475,
            width=68,
            height=143,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 143
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
            x=866,
            y=620,
            width=120,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 120,
            sourceHeight = 64
        },
        {
            -- trees
            x=2,
            y=367,
            width=908,
            height=172,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 908,
            sourceHeight = 172
        },
    },
    
    sheetContentWidth = 1004,
    sheetContentHeight = 1023
}

SheetInfo.frameIndex =
{

    ["StartPage_New"] = 1,
    ["bird_green"] = 2,
    ["button_about"] = 3,
    ["button_start"] = 4,
    ["cloud_large"] = 5,
    ["cloud_small"] = 6,
    ["coin"] = 7,
    ["derpy_bird_logo"] = 8,
    ["ground"] = 9,
    ["heart_empty"] = 10,
    ["heart_full"] = 11,
    ["mountains"] = 12,
    ["ring"] = 13,
    ["start_background"] = 14,
    ["start_bird"] = 15,
    ["trees"] = 16,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

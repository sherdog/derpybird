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
            x=648,
            y=1082,
            width=640,
            height=960,

        },
        {
            -- bird_green
            x=1824,
            y=870,
            width=142,
            height=76,

        },
        {
            -- button_about
            x=1618,
            y=1434,
            width=200,
            height=58,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 57
        },
        {
            -- button_start
            x=1618,
            y=1372,
            width=200,
            height=58,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 57
        },
        {
            -- cloud_large
            x=1292,
            y=1300,
            width=322,
            height=132,

        },
        {
            -- cloud_small
            x=1824,
            y=734,
            width=178,
            height=132,

        },
        {
            -- coin
            x=1732,
            y=1082,
            width=46,
            height=64,

        },
        {
            -- derpy_bird_logo
            x=1292,
            y=1082,
            width=436,
            height=214,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 435,
            sourceHeight = 214
        },
        {
            -- ground
            x=4,
            y=584,
            width=2000,
            height=146,

        },
        {
            -- heart_empty
            x=1964,
            y=994,
            width=38,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 37,
            sourceHeight = 39
        },
        {
            -- heart_full
            x=1964,
            y=950,
            width=38,
            height=40,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 37,
            sourceHeight = 39
        },
        {
            -- mountains
            x=4,
            y=4,
            width=2000,
            height=576,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 2000,
            sourceHeight = 575
        },
        {
            -- ring
            x=1824,
            y=950,
            width=136,
            height=286,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 135,
            sourceHeight = 286
        },
        {
            -- start_background
            x=4,
            y=1082,
            width=640,
            height=960,

        },
        {
            -- start_bird
            x=1732,
            y=1240,
            width=240,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 239,
            sourceHeight = 128
        },
        {
            -- trees
            x=4,
            y=734,
            width=1816,
            height=344,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 1816,
            sourceHeight = 343
        },
    },
    
    sheetContentWidth = 2008,
    sheetContentHeight = 2046
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

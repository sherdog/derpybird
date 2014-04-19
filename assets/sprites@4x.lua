--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:965b77092252ed27c741423d6bf0de7d:b63b00c6c9e663a2692ae208bc447a71:f5c322b4188998d6cd973301e8657e5f$
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
            x=1114,
            y=1122,
            width=254,
            height=124,

        },
        {
            -- bird_2
            x=1032,
            y=1258,
            width=254,
            height=124,

        },
        {
            -- bird_green
            x=1372,
            y=1200,
            width=142,
            height=76,

        },
        {
            -- bird_green_flying_1
            x=1824,
            y=1038,
            width=150,
            height=80,

        },
        {
            -- bird_green_flying_2
            x=1824,
            y=954,
            width=150,
            height=80,

        },
        {
            -- bird_green_flying_3
            x=1824,
            y=1038,
            width=150,
            height=80,

        },
        {
            -- bird_green_flying_4
            x=1824,
            y=954,
            width=150,
            height=80,

        },
        {
            -- bird_green_flying_5
            x=1824,
            y=1038,
            width=150,
            height=80,

        },
        {
            -- bird_green_flying_6
            x=1824,
            y=870,
            width=150,
            height=80,

        },
        {
            -- button_about-over
            x=1772,
            y=1188,
            width=196,
            height=52,

        },
        {
            -- button_about
            x=1780,
            y=1126,
            width=200,
            height=58,

        },
        {
            -- button_back-over
            x=1572,
            y=1144,
            width=196,
            height=52,

        },
        {
            -- button_back
            x=1576,
            y=1082,
            width=200,
            height=58,

        },
        {
            -- button_start-over
            x=1372,
            y=1144,
            width=196,
            height=52,

        },
        {
            -- button_start
            x=1372,
            y=1082,
            width=200,
            height=58,

        },
        {
            -- cloud_large
            x=788,
            y=1122,
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
            x=1290,
            y=1250,
            width=46,
            height=64,

        },
        {
            -- coin32
            x=1978,
            y=870,
            width=24,
            height=32,

        },
        {
            -- derpy_bird_logo
            x=648,
            y=1412,
            width=436,
            height=214,

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
            x=1518,
            y=1200,
            width=38,
            height=40,

        },
        {
            -- heart_full
            x=1780,
            y=1082,
            width=38,
            height=40,

        },
        {
            -- mountains
            x=4,
            y=4,
            width=2000,
            height=576,

        },
        {
            -- ring
            x=648,
            y=1122,
            width=136,
            height=286,

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
            x=788,
            y=1258,
            width=240,
            height=128,

        },
        {
            -- trees
            x=4,
            y=734,
            width=1816,
            height=344,

        },
    },
    
    sheetContentWidth = 2008,
    sheetContentHeight = 2046
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
    ["derpy_bird_logo"] = 20,
    ["ground"] = 21,
    ["heart_empty"] = 22,
    ["heart_full"] = 23,
    ["mountains"] = 24,
    ["ring"] = 25,
    ["start_background"] = 26,
    ["start_bird"] = 27,
    ["trees"] = 28,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

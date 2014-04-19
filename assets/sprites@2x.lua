--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b4ea8cef89b93f103b5e476a8395f76d:5a12ee075c9e596cae2eb30e8434f9a8:f5c322b4188998d6cd973301e8657e5f$
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
            -- background_blue_green
            x=4,
            y=1082,
            width=640,
            height=960,

        },
        {
            -- bird_1
            x=1500,
            y=1276,
            width=254,
            height=124,

        },
        {
            -- bird_2
            x=1242,
            y=1218,
            width=254,
            height=124,

        },
        {
            -- bird_green
            x=1812,
            y=1122,
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
            x=1442,
            y=1460,
            width=196,
            height=52,

        },
        {
            -- button_about
            x=1242,
            y=1346,
            width=200,
            height=58,

        },
        {
            -- button_back-over
            x=1646,
            y=1412,
            width=196,
            height=52,

        },
        {
            -- button_back
            x=1758,
            y=1350,
            width=200,
            height=58,

        },
        {
            -- button_restart
            x=1758,
            y=1288,
            width=200,
            height=58,

        },
        {
            -- button_restart_over
            x=1242,
            y=1408,
            width=196,
            height=52,

        },
        {
            -- button_start-over
            x=1446,
            y=1404,
            width=196,
            height=52,

        },
        {
            -- button_start
            x=1568,
            y=1214,
            width=200,
            height=58,

        },
        {
            -- cloud_large
            x=1242,
            y=1082,
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
            x=1168,
            y=1082,
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
            -- coin_brown
            x=1168,
            y=1150,
            width=44,
            height=64,

        },
        {
            -- derpy_bird_logo
            x=788,
            y=1736,
            width=436,
            height=214,

        },
        {
            -- game_over_box
            x=648,
            y=1122,
            width=516,
            height=610,

        },
        {
            -- game_over_title
            x=788,
            y=1954,
            width=450,
            height=76,

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
            x=1958,
            y=1166,
            width=38,
            height=40,

        },
        {
            -- heart_full
            x=1958,
            y=1122,
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
            y=1736,
            width=136,
            height=286,

        },
        {
            -- ring_brown
            x=1772,
            y=1214,
            width=34,
            height=70,

        },
        {
            -- ring_small
            x=1812,
            y=1202,
            width=34,
            height=70,

        },
        {
            -- start_bird
            x=1568,
            y=1082,
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

    ["background_blue_green"] = 1,
    ["bird_1"] = 2,
    ["bird_2"] = 3,
    ["bird_green"] = 4,
    ["bird_green_flying_1"] = 5,
    ["bird_green_flying_2"] = 6,
    ["bird_green_flying_3"] = 7,
    ["bird_green_flying_4"] = 8,
    ["bird_green_flying_5"] = 9,
    ["bird_green_flying_6"] = 10,
    ["button_about-over"] = 11,
    ["button_about"] = 12,
    ["button_back-over"] = 13,
    ["button_back"] = 14,
    ["button_restart"] = 15,
    ["button_restart_over"] = 16,
    ["button_start-over"] = 17,
    ["button_start"] = 18,
    ["cloud_large"] = 19,
    ["cloud_small"] = 20,
    ["coin"] = 21,
    ["coin32"] = 22,
    ["coin_brown"] = 23,
    ["derpy_bird_logo"] = 24,
    ["game_over_box"] = 25,
    ["game_over_title"] = 26,
    ["ground"] = 27,
    ["heart_empty"] = 28,
    ["heart_full"] = 29,
    ["mountains"] = 30,
    ["ring"] = 31,
    ["ring_brown"] = 32,
    ["ring_small"] = 33,
    ["start_bird"] = 34,
    ["trees"] = 35,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

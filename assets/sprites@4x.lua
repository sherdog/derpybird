--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:980e5db5572d93f53bc10fc856d3b0b3:4a6ae599f09d6c2fc6e0894b0bb38bae:f5c322b4188998d6cd973301e8657e5f$
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
            x=8,
            y=2164,
            width=1280,
            height=1920,

        },
        {
            -- bird_1
            x=3476,
            y=2244,
            width=508,
            height=248,

        },
        {
            -- bird_2
            x=2960,
            y=2164,
            width=508,
            height=248,

        },
        {
            -- bird_green
            x=2176,
            y=3744,
            width=284,
            height=152,

        },
        {
            -- bird_green_flying_1
            x=3648,
            y=2076,
            width=300,
            height=160,

        },
        {
            -- bird_green_flying_2
            x=3648,
            y=1908,
            width=300,
            height=160,

        },
        {
            -- bird_green_flying_3
            x=3648,
            y=2076,
            width=300,
            height=160,

        },
        {
            -- bird_green_flying_4
            x=3648,
            y=1908,
            width=300,
            height=160,

        },
        {
            -- bird_green_flying_5
            x=3648,
            y=2076,
            width=300,
            height=160,

        },
        {
            -- bird_green_flying_6
            x=3648,
            y=1740,
            width=300,
            height=160,

        },
        {
            -- button_about-over
            x=2336,
            y=2276,
            width=392,
            height=104,

        },
        {
            -- button_about
            x=3448,
            y=2500,
            width=400,
            height=116,

        },
        {
            -- button_back-over
            x=2336,
            y=2164,
            width=392,
            height=104,

        },
        {
            -- button_back
            x=2336,
            y=3344,
            width=400,
            height=116,

        },
        {
            -- button_restart
            x=2552,
            y=3868,
            width=400,
            height=116,

        },
        {
            -- button_restart_over
            x=2960,
            y=2684,
            width=392,
            height=104,

        },
        {
            -- button_start-over
            x=3448,
            y=2624,
            width=392,
            height=104,

        },
        {
            -- button_start
            x=2468,
            y=3744,
            width=400,
            height=116,

        },
        {
            -- cloud_large
            x=2176,
            y=3472,
            width=644,
            height=264,

        },
        {
            -- cloud_small
            x=3648,
            y=1468,
            width=356,
            height=264,

        },
        {
            -- coin
            x=2356,
            y=3904,
            width=92,
            height=128,

        },
        {
            -- coin32
            x=3956,
            y=1740,
            width=48,
            height=64,

        },
        {
            -- coin_brown
            x=2456,
            y=3904,
            width=88,
            height=128,

        },
        {
            -- derpy_bird_logo
            x=1296,
            y=3472,
            width=872,
            height=428,

        },
        {
            -- game_over_box
            x=1296,
            y=2244,
            width=1032,
            height=1220,

        },
        {
            -- game_over_title
            x=1296,
            y=3908,
            width=900,
            height=152,

        },
        {
            -- ground
            x=8,
            y=1168,
            width=4000,
            height=292,

        },
        {
            -- heart_empty
            x=2636,
            y=3992,
            width=76,
            height=80,

        },
        {
            -- heart_full
            x=2552,
            y=3992,
            width=76,
            height=80,

        },
        {
            -- mountains
            x=8,
            y=8,
            width=4000,
            height=1152,

        },
        {
            -- ring
            x=2336,
            y=2684,
            width=292,
            height=652,

        },
        {
            -- ring_brown
            x=2280,
            y=3904,
            width=68,
            height=140,

        },
        {
            -- ring_small
            x=2204,
            y=3904,
            width=68,
            height=140,

        },
        {
            -- start_bird
            x=2960,
            y=2420,
            width=480,
            height=256,

        },
        {
            -- trees
            x=8,
            y=1468,
            width=3632,
            height=688,

        },
    },
    
    sheetContentWidth = 4016,
    sheetContentHeight = 4092
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

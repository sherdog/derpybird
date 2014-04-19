--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e1a39c676c5992fbf74c173e0145f148:37492e0c7770f73caf02ea755a376850:f5c322b4188998d6cd973301e8657e5f$
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
            x=3000,
            y=2552,
            width=508,
            height=248,

        },
        {
            -- bird_2
            x=2484,
            y=2436,
            width=508,
            height=248,

        },
        {
            -- bird_green
            x=3624,
            y=2244,
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
            x=2484,
            y=2804,
            width=392,
            height=104,

        },
        {
            -- button_about
            x=3516,
            y=2676,
            width=400,
            height=116,

        },
        {
            -- button_back-over
            x=2484,
            y=2692,
            width=392,
            height=104,

        },
        {
            -- button_back
            x=3516,
            y=2552,
            width=400,
            height=116,

        },
        {
            -- button_start-over
            x=3516,
            y=2800,
            width=392,
            height=104,

        },
        {
            -- button_start
            x=3136,
            y=2428,
            width=400,
            height=116,

        },
        {
            -- cloud_large
            x=2484,
            y=2164,
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
            x=2336,
            y=2164,
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
            x=2336,
            y=2300,
            width=88,
            height=128,

        },
        {
            -- derpy_bird_logo
            x=1576,
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
            x=1576,
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
            x=3916,
            y=2332,
            width=76,
            height=80,

        },
        {
            -- heart_full
            x=3916,
            y=2244,
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
            x=1296,
            y=3472,
            width=272,
            height=572,

        },
        {
            -- ring_brown
            x=3624,
            y=2404,
            width=68,
            height=140,

        },
        {
            -- start_bird
            x=3136,
            y=2164,
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
    ["button_start-over"] = 15,
    ["button_start"] = 16,
    ["cloud_large"] = 17,
    ["cloud_small"] = 18,
    ["coin"] = 19,
    ["coin32"] = 20,
    ["coin_brown"] = 21,
    ["derpy_bird_logo"] = 22,
    ["game_over_box"] = 23,
    ["game_over_title"] = 24,
    ["ground"] = 25,
    ["heart_empty"] = 26,
    ["heart_full"] = 27,
    ["mountains"] = 28,
    ["ring"] = 29,
    ["ring_brown"] = 30,
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

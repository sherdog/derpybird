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
            x=557,
            y=561,
            width=127,
            height=62,

        },
        {
            -- bird_2
            x=516,
            y=629,
            width=127,
            height=62,

        },
        {
            -- bird_green
            x=686,
            y=600,
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
            x=886,
            y=594,
            width=98,
            height=26,

        },
        {
            -- button_about
            x=890,
            y=563,
            width=100,
            height=29,

        },
        {
            -- button_back-over
            x=786,
            y=572,
            width=98,
            height=26,

        },
        {
            -- button_back
            x=788,
            y=541,
            width=100,
            height=29,

        },
        {
            -- button_start-over
            x=686,
            y=572,
            width=98,
            height=26,

        },
        {
            -- button_start
            x=686,
            y=541,
            width=100,
            height=29,

        },
        {
            -- cloud_large
            x=394,
            y=561,
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
            x=645,
            y=625,
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
            -- derpy_bird_logo
            x=324,
            y=706,
            width=218,
            height=107,

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
            x=759,
            y=600,
            width=19,
            height=20,

        },
        {
            -- heart_full
            x=890,
            y=541,
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
            y=561,
            width=68,
            height=143,

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
            x=394,
            y=629,
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

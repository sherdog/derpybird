--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8d5e83e06e3dab3dc21710315c87bbc9:2c3cbe68f2b7d139f98edc45377a76c8:b34e8ae32315bad3d8061f63e7a0b62c$
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
            -- bird_coming_1
            x=90,
            y=80,
            width=28,
            height=18,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 28,
            sourceHeight = 17
        },
        {
            -- bird_coming_2
            x=52,
            y=80,
            width=36,
            height=23,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 36,
            sourceHeight = 22
        },
        {
            -- bird_coming_3
            x=2,
            y=80,
            width=48,
            height=30,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 48,
            sourceHeight = 29
        },
        {
            -- bird_coming_4
            x=127,
            y=57,
            width=67,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 67,
            sourceHeight = 41
        },
        {
            -- bird_coming_5
            x=127,
            y=2,
            width=85,
            height=53,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 85,
            sourceHeight = 52
        },
        {
            -- bird_coming_6
            x=2,
            y=2,
            width=123,
            height=76,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 123,
            sourceHeight = 76
        },
    },
    
    sheetContentWidth = 214,
    sheetContentHeight = 112
}

SheetInfo.frameIndex =
{

    ["bird_coming_1"] = 1,
    ["bird_coming_2"] = 2,
    ["bird_coming_3"] = 3,
    ["bird_coming_4"] = 4,
    ["bird_coming_5"] = 5,
    ["bird_coming_6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

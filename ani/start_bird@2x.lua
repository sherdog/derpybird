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
            x=180,
            y=160,
            width=56,
            height=36,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 56,
            sourceHeight = 35
        },
        {
            -- bird_coming_2
            x=104,
            y=160,
            width=72,
            height=46,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 72,
            sourceHeight = 45
        },
        {
            -- bird_coming_3
            x=4,
            y=160,
            width=96,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 95,
            sourceHeight = 59
        },
        {
            -- bird_coming_4
            x=254,
            y=114,
            width=134,
            height=84,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 134,
            sourceHeight = 83
        },
        {
            -- bird_coming_5
            x=254,
            y=4,
            width=170,
            height=106,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 170,
            sourceHeight = 105
        },
        {
            -- bird_coming_6
            x=4,
            y=4,
            width=246,
            height=152,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 246,
            sourceHeight = 152
        },
    },
    
    sheetContentWidth = 428,
    sheetContentHeight = 224
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

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
            x=360,
            y=320,
            width=112,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 112,
            sourceHeight = 69
        },
        {
            -- bird_coming_2
            x=208,
            y=320,
            width=144,
            height=92,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 144,
            sourceHeight = 89
        },
        {
            -- bird_coming_3
            x=8,
            y=320,
            width=192,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 190,
            sourceHeight = 117
        },
        {
            -- bird_coming_4
            x=508,
            y=228,
            width=268,
            height=168,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 268,
            sourceHeight = 165
        },
        {
            -- bird_coming_5
            x=508,
            y=8,
            width=340,
            height=212,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 340,
            sourceHeight = 209
        },
        {
            -- bird_coming_6
            x=8,
            y=8,
            width=492,
            height=304,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 492,
            sourceHeight = 303
        },
    },
    
    sheetContentWidth = 856,
    sheetContentHeight = 448
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

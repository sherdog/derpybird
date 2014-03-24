--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:80bb4a95f7fcd00b5a96cb8890e3885f:41c225533e8e0056f95df3a783fbafc1:de6eb9fda28cd13ea07e9326597a6f0d$
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
            -- background
            x=2,
            y=2,
            width=900,
            height=1425,

        },
        {
            -- bird_large_front
            x=2,
            y=1429,
            width=320,
            height=197,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 197
        },
        {
            -- btn-play-over
            x=179,
            y=1628,
            width=175,
            height=75,

        },
        {
            -- btn-play
            x=2,
            y=1628,
            width=175,
            height=75,

        },
        {
            -- cloud_1
            x=612,
            y=1591,
            width=127,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 127,
            sourceHeight = 60
        },
        {
            -- cloud_1@2x
            x=356,
            y=1591,
            width=254,
            height=119,

        },
        {
            -- derpy_bird_logo
            x=741,
            y=1429,
            width=150,
            height=123,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 150,
            sourceHeight = 123
        },
        {
            -- flying_bird01
            x=676,
            y=1452,
            width=35,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 21
        },
        {
            -- flying_bird02
            x=676,
            y=1429,
            width=35,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 21
        },
        {
            -- flying_bird03
            x=676,
            y=1554,
            width=35,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 21
        },
        {
            -- ring-orage
            x=713,
            y=1429,
            width=18,
            height=132,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 18,
            sourceHeight = 132
        },
        {
            -- small_bird
            x=676,
            y=1452,
            width=35,
            height=21,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 21
        },
        {
            -- stage_ground
            x=324,
            y=1429,
            width=350,
            height=160,

        },
    },
    
    sheetContentWidth = 904,
    sheetContentHeight = 1712
}

SheetInfo.frameIndex =
{

    ["background"] = 1,
    ["bird_large_front"] = 2,
    ["btn-play-over"] = 3,
    ["btn-play"] = 4,
    ["cloud_1"] = 5,
    ["cloud_1@2x"] = 6,
    ["derpy_bird_logo"] = 7,
    ["flying_bird01"] = 8,
    ["flying_bird02"] = 9,
    ["flying_bird03"] = 10,
    ["ring-orage"] = 11,
    ["small_bird"] = 12,
    ["stage_ground"] = 13,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

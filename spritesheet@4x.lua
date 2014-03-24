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
            x=4,
            y=4,
            width=1800,
            height=2850,

        },
        {
            -- bird_large_front
            x=4,
            y=2858,
            width=640,
            height=394,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 639,
            sourceHeight = 393
        },
        {
            -- btn-play-over
            x=358,
            y=3256,
            width=350,
            height=150,

        },
        {
            -- btn-play
            x=4,
            y=3256,
            width=350,
            height=150,

        },
        {
            -- cloud_1
            x=1224,
            y=3182,
            width=254,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 254,
            sourceHeight = 119
        },
        {
            -- cloud_1@2x
            x=712,
            y=3182,
            width=508,
            height=238,

        },
        {
            -- derpy_bird_logo
            x=1482,
            y=2858,
            width=300,
            height=246,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 299,
            sourceHeight = 246
        },
        {
            -- flying_bird01
            x=1352,
            y=2904,
            width=70,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 41
        },
        {
            -- flying_bird02
            x=1352,
            y=2858,
            width=70,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 41
        },
        {
            -- flying_bird03
            x=1352,
            y=3108,
            width=70,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 41
        },
        {
            -- ring-orage
            x=1426,
            y=2858,
            width=36,
            height=264,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 35,
            sourceHeight = 263
        },
        {
            -- small_bird
            x=1352,
            y=2904,
            width=70,
            height=42,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 70,
            sourceHeight = 41
        },
        {
            -- stage_ground
            x=648,
            y=2858,
            width=700,
            height=320,

        },
    },
    
    sheetContentWidth = 1808,
    sheetContentHeight = 3424
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

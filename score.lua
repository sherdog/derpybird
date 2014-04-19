local M = {} --create the local module table (this will hold our functions and data)
M.score = 0 --set the initial score to 0

function M.init( options )
    
    local customOptions = options or {}
    local opt = {}
    
    opt.fontSize = customOptions.fontSize or 24
    opt.font = customOptions.font or native.systemFontBold
    opt.x = customOptions.x or display.contentCenterX
    opt.y = customOptions.y or opt.fontSize*0.5
    opt.maxDigits = customOptions.maxDigits or 6
    opt.leadingZeros = customOptions.leadingZeros or false
    M.filename = customOptions.filename or "scorefile.txt"
    
    local prefix = ""
    
    if ( opt.leadingZeros ) then
        prefix = "0"
    end
    
    M.format = "%" .. prefix .. opt.maxDigits .. "d"
    M.scoreText = display.newText( string.format(M.format, 0), opt.x, opt.y, opt.font, opt.fontSize )
    
    return M.scoreText
end
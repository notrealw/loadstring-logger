local function returnfinalnumber(path:string)
    local maxnumber = 0
    for __,file in pairs(listfiles(path)) do
        local filename = string.split(file, "\\")
        local numberandtype = string.split(filename[2], "_")
        local stringnumber = string.split(numberandtype[2], ".")
        local number = tonumber(stringnumber[1])
        if number > maxnumber then
            maxnumber = number
        end
    end
    return maxnumber
end

local hook
hook = hookfunction(loadstring, function(...)
    args = {...}
    if not isfolder("Loadstring Logger") then
        makefolder("Loadstring Logger")
        writefile("Loadstring Logger/loadstring_".."1"..".lua", unpack(args))
    else
        if unpack(listfiles("Loadstring Logger")) == nil then
            writefile("Loadstring Logger/loadstring_".."1"..".lua", unpack(args))
        else
            local value = returnfinalnumber("Loadstring Logger") + 1
            writefile("Loadstring Logger/loadstring_"..tostring(value)..".lua", unpack(args))
        end
    end
    return hook(...)
end)

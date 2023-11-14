-- use auto exec
print("anti-Logger: true")
local request = http_request or request or HttpPost or syn.request or fluxus.request
local oldfunc
oldfunc = hookfunction(request, function(requestData,...)
    if(string.find(requestData.Url, 'discord') or string.find(requestData.Url, 'webhook') or string.find(requestData.Url, 'ipv4')) then
        requestData.Url = 'i like cats'
        print("i like cats")
    end

    return oldfunc(requestData,...)
end)

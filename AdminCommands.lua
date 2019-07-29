local m ={}
game.Players.PlayerAdded: Connect(function(player)
     player.Chatted:Connect(function(msg,r)
     m.parse(player,msg)
      if r then return end

end)
end)
local Dstore=game:GetService("DataStoreService")
m.database=Dstore:GetDataStore("adminCommands")
m.adminList = {
      
189277962;
-1;
}
m.commandStart="!"
local aList
pcall(function()
aList=m.database:GetAsync("adminList")
end)
if not aList then
m.database:SetAsync("adminList",m.adminList)
aList = m.adminList
end 
function m.parse(msg,player )
local playerIsAdmin
for a,b in pairs(aList)
playerIsAdmin=b==player.UserId
if playerIsAdmin then break
end)
if playerIsAdmin then 
if msg:sub(1,1) then
if #msg ==1 then
warn("just the Command signature, consider inputing a command")
else
local line=msg:sub(2 ,#msg)
local command,arguments=nil,{}
for a in line:gmatch("[%w%p]+")do
if command==nil then command=a else table.insert(arguments,a)end
end
If m.commands[command] then

else
warn("command doesn’t exist "..command)
end
end
end
end
end
m.commands={
addAdmin=function(arg,caller)
for a,b in pairs(arg) do
if tonumber(b) then
table.insert(tonumber(b),aList)
m.database:SetAsync("adminList",aList)
else
local UserID=game.Players:GetUserIdFromNameAsync(b)
if UserId then
table.insert(UserId,aList)
m.database:SetAsync("adminList",aList)
else
m.warn("addAdmin","Player Name\""..b.. "\"is not a valid player")
end
end
end
end;
removeAdmin=function(arg,caller)
for a,b in pairs(arg) do
if tonumber(b) then
for d,c in pairs(aList) do 
if c==tonumber(b) then 
table.remove(tonumber(b),aList)
break
end
end
m.database:SetAsync("adminList",aList)
else
local local UserID=game.Players:GetUserIdFromNameAsync(b)
if UserId then
for d,c in pairs(aList) do 
if c==UserID then 
table.remove(UserID,aList)
break
end
end
m.database:SetAsync("adminList",aList)
else
m.warn("removeAdmin","Player Name\""..b.. "\"is not a valid player")
end
end
end
end;
}
function m.warn(cmd,issue)
warn("In Command ".. m.commandStart..cmd.." issue occurred, receipt: "..issue)

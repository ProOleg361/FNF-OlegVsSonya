-- this shit is from the mod darkness takeover lol
function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'Luigi_NOTE_assets');

        end
    end
end

local defaultNotePos = {};
local Y1 = -5;
local Y2 = 5;
local X1 = -5;
local X2 = 5;
local move = true;

function onSongStart()

    for i = 0, getProperty('opponentStrums.length')-1 do

        setPropertyFromGroup('opponentStrums', i, 'texture', 'Luigi_NOTE_assets');
    end
for i = 0,3 do
x = getPropertyFromGroup('strumLineNotes', i, 'x')

y = getPropertyFromGroup('strumLineNotes', i, 'y')

table.insert(defaultNotePos, {x,y})

end
end

function onUpdate(elapsed)
    if  move == true then
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(X1, X2) * math.sin((currentBeat + i*1.35) * math.pi))

            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(Y1, Y2) * math.cos((currentBeat + i*1.65) * math.pi))
        end
    end
end
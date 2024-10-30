function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.28 then
        setProperty('health', health- 0.020);
    end
end
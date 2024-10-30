
local xx = 980;
local yy = 350;
local yyh = 350;
local xx2 = 220;
local yy2 = 350;
local ofs = 30;
local ofs2 = 120;
local followchars = true;
local del = 0;
local del2 = 0;

local allowCountdown = false 
function onStartCountdown() 
 if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown 
 startVideo('OGN_cutscene'); 
 allowCountdown = true; 
 return Function_Stop; 
 end 
	return Function_Continue;
end
function onCreatePost()
    makeAnimatedLuaSprite('darwinanimation1', 'Darwin_Anim1', 400, 200);
	addAnimationByPrefix('darwinanimation1', 'animation', 'Darwin Animacion 1', 24, false);
    setObjectCamera('darwinanimation1', 'other')
	scaleObject('darwinanimation1', 2.4, 2.4);
    setProperty('darwinanimation1.alpha', 0)
	addLuaSprite('darwinanimation1',true);

    makeAnimatedLuaSprite('darwinanimation2', 'Darwin_Anim2', 370, 200);
	addAnimationByPrefix('darwinanimation2', 'animation', 'Darwin Animacion 2', 24, false);
    setObjectCamera('darwinanimation2', 'other')
	scaleObject('darwinanimation2', 2.4, 2.4);
    setProperty('darwinanimation2.alpha', 0)
	addLuaSprite('darwinanimation2',true);

    setProperty('Orange.alpha', 0)
    setProperty('Blue.alpha', 0)
    setProperty('camHUD.alpha', 0)
    --delete this if you want the og position
    setProperty('boyfriendGroup.x', 0)
    setProperty('dadGroup.x', 930)
end

function onSongStart()
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
    noteTweenX("NoteC1", 4, 396, 0.1)
    noteTweenX("NoteC2", 5, 508, 0.1)
    noteTweenX("NoteC3", 6, 620, 0.1)
    noteTweenX("NoteC4", 7, 732, 0.1)

    noteTweenX("NoteMove5", 0, 732, 0.1)
    noteTweenX("NoteMove6", 1, 844, 0.1)
    noteTweenX("NoteMove7", 2, 956, 0.1)
    noteTweenX("NoteMove8", 3, 1068, 0.1)
    end

    noteTweenAlpha("NoteFade1", 0, 0, 0.1)
    noteTweenAlpha("NoteFade2", 1, 0, 0.1)
    noteTweenAlpha("NoteFade3", 2, 0, 0.1)
    noteTweenAlpha("NoteFade4", 3, 0, 0.1)
end

function onUpdate()
    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'Hey' then
                triggerEvent('Camera Follow Pos',xx-ofs,yyh)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','600','350')
    end
    
end

function onStepHit()
    if curStep == 4 then
        objectPlayAnimation('darwinanimation1', 'animation', true)
        doTweenAlpha('laanimaciondarwin', 'darwinanimation1', 1, 0.5, 'linear')
        doTweenX('escalaqliadadarwinx', 'darwinanimation1.scale', 2.7, 0.5, 'linear')
        doTweenY('escalaqliadadarwiny', 'darwinanimation1.scale', 2.7, 0.5, 'linear')
    end
    if curStep == 28 then
        doTweenAlpha('elhud', 'camHUD', 1, 0.4, 'linear')
    end
    if curStep == 704 then
        doTweenAlpha('holapenny', 'gf', 1, 3, 'linear')
    end
    if curStep == 1228 then
        objectPlayAnimation('darwinanimation2', 'animation', true)
        doTweenAlpha('vuelvedarwinxdxd', 'darwinanimation2', 1, 0.5, 'linear')
        doTweenX('otravezestawebonada', 'darwinanimation2.scale', 2.7, 0.5, 'linear')
        doTweenY('queweaquewea', 'darwinanimation2.scale', 2.7, 0.5, 'linear')
    end
    if curStep == 1243 then
        doTweenAlpha('sevadarwinepicamente', 'darwinanimation2', 0, 1, 'linear')
    end
    if curStep == 1376 then
        doTweenAlpha('darwinteodia', 'teodioimagen', 1, 0.5, 'linear')
    end
    if curStep == 1402 then
        doTweenAlpha('sevalacamara', 'camGame', 0, 0.3, 'linear')
        doTweenAlpha('sevaelcamhud', 'camHUD', 0, 0.7, 'linear')
    end
end
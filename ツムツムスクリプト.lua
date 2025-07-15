function isim(libs)
    local startAddress, endAddress
    if type(libs) ~= "table" then
        libs = {libs}
    end

    for _, lib in ipairs(libs) do
        local aralik = gg.getRangesList(lib)
        for i, v in ipairs(aralik) do
            if v.state == "Xa" then
                startAddress = v.start
                endAddress = aralik[#aralik]['end']
                return startAddress, endAddress
            end
        end
    end
    return nil, nil
end

local startAddress, endAddress = isim({"split_config.arm64_v8a.apk", "libcocos2dcpp"})

function setHexMemory(libisim, offset, hex)
    isim(libisim)
    t, hepsi = {}, 0
    for h in string.gmatch(hex, "%S%S") do
        table.insert(t, {
            address = startAddress + offset + hepsi,
            flags = gg.TYPE_BYTE,
            value = h .. "r"
        })
        hepsi = hepsi + 1
    end
    sonuc = gg.setValues(t)
    if type(sonuc) ~= 'string' then return true else gg.alert(sonuc) return false end
end

gg.alert("スクリプト制作：きょう", 'start')
function Main()
	local menu = gg.choice({
        "コインメニュー",
        "メインメニュー",
        "倍速メニュー",
        "メダルメニュー",
        "スクリプト終了",
    }, nil, "スクリプト制作：きょう\nツムツムスクリプトv" .. gg.getTargetInfo().versionName)

    if menu == nil then
        return
    else
        if menu == 1 then BB() end
        if menu == 2 then CC() end
        if menu == 3 then DD() end
        if menu == 4 then EE() end
        if menu == 5 then exit() end
    end
end
--CoinMenu--
toggle_coin1 = false 
toggle_coin2 = false
toggle_coin3 = false
toggle_coin4 = false
--MainMENU--
state_soku = false
state_soku1 = false
state_tumumax = false
state_payermax = false
state_gs = false
state_rs = false
--倍速menu--
state_baisoku1 = false
state_baisoku2 = false
state_baisoku3 = false
--メダルmenu--
state_medal1 = false
state_medal2 = false
state_medal3 = false
state_medal4 = false

function BB()
    local state_coin1 = toggle_coin1 and "コイン1億 OFF" or "コイン1億 ON"
    local state_coin2 = toggle_coin2 and "コイン2億 OFF" or "コイン2億 ON"
    local state_coin3 = toggle_coin3 and "コイン5000万 OFF" or "コイン5000万 ON"
    local state_coin4 = toggle_coin4 and "コイン1000万 OFF" or "コイン1000万 ON"
    ww=gg.multiChoice({
        state_coin1,
        state_coin2,
        state_coin3,
        state_coin4,
        "戻る",
    })
    if ww == nil then return end
    if ww[1] == true then m1() end
    if ww[2] == true then m2() end
    if ww[3] == true then m3() end
    if ww[4] == true then m4() end
    if ww[5] == true then Main() end
    if BB == nil then
        return
    end
end

function m1()
    if toggle_coin1 then
            setHexMemory("libcocos2dcpp.so", 0x180B428, "F4 03 01 2A")
            gg.toast("コイン1億 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x180B428, "14 C0 A0 52")
            gg.toast("コイン1億 ON")
    end
    toggle_coin1 = not toggle_coin1
end
function m2()
    if toggle_coin2 then
            setHexMemory("libcocos2dcpp.so", 0x180B428, "F4 03 01 2A")
            gg.toast("コイン2億 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x180B428, "94 7D A1 52")
            gg.toast("コイン2億 ON")
    end
    toggle_coin2 = not toggle_coin2
end
 function m3()
    if toggle_coin3 then
        setHexMemory("libcocos2dcpp.so", 0x180B428, "F4 03 01 2A")
        gg.toast("コイン5000万 OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x180B428, "14 60 A0 52")
        gg.toast("コイン5000万 ON")
end
    toggle_coin3 = not toggle_coin3
end
function m4()
    if toggle_coin4 then
        setHexMemory("libcocos2dcpp.so", 0x180B428, "F4 03 01 2A")
        gg.toast("コイン1000万 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x180B428, "34 13 A0 52")
        gg.toast("コイン1000万 ON")
end
    
    toggle_coin4 = not toggle_coin4
end


function CC()
    local state_soku = toggle_soku and "即終了 OFF" or "即終了 ON"
    local state_soku1 = toggle_soku1 and "繋ぎ終了 OFF" or "繋ぎ終了 ON"
    local state_tumumax = toggle_tumumax and "ツムレベルMAX OFF" or "ツムレベルMAX ON"
    local state_payermax = toggle_payermax and "プレイヤーレベルMAX OFF" or "プレイヤーレベルMAX ON"
    local state_gs = toggle_gs and "ガチャ演出スキップ OFF" or "ガチャ演出スキップ ON"
    local state_rs = toggle_rs and "リザルトスキップ OFF" or "リザルトスキップ ON"
    xx=gg.multiChoice({
        state_soku,
        state_soku1,
        state_tumumax,
        state_payermax,
        state_gs,
        state_rs,
        "戻る",
    })
    if xx == nil then return end
    if xx[1] == true then sh1() end
    if xx[2] == true then sh2() end
    if xx[3] == true then sh3() end
    if xx[4] == true then sh4() end
    if xx[5] == true then sh5() end
    if xx[6] == true then sh6() end
    if xx[7] == true then Main() end
    if CC == nil then
        return
    end
end

function sh1()
    if toggle_soku then
            setHexMemory("libcocos2dcpp.so", 0x1FE7908, "00 20 21 1E")
            gg.toast("即終了 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x1FE7908, "00 10 24 1E")
            gg.toast("即終了 ON")
    end
    toggle_soku = not toggle_soku
end
 function sh2()
    if toggle_soku1 then
        setHexMemory("libcocos2dcpp.so", 0x1828EBC, "21 07 00 54")
        gg.toast("繋ぎ終了 OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x1828EBC, "20 07 00 54")
        gg.toast("繋ぎ終了 ON")
end
    toggle_soku1 = not toggle_soku1
end
function sh3()
    if toggle_tumumax then
        setHexMemory("libcocos2dcpp.so", 0x18238A4, "21 05 00 11")
        gg.toast("ツムレベルMAX OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x18238A4, "01 6A 98 52")
        gg.toast("ムツレベルMAX ON")
end
    
    toggle_tumumax = not toggle_tumumax
end
function sh4()
     if toggle_payermax then
        setHexMemory("libcocos2dcpp.so", 0x18334D8, "F4 03 01 2A")
        gg.toast("プレイヤーレベルMAX OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x18334D8, "F4 0F 27 32")
        gg.toast("プレイヤーレベルMAX ON")
    end
        toggle_payermax = not toggle_payermax
end

function sh5()
     if toggle_gs then
        setHexMemory("libcocos2dcpp.so", 0x1861830, "FF 43 01 D1")
        gg.toast("ガチャ演出スキップ OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x1861830, "C0 03 5F D6")
        gg.toast("ガチャ演出スキップ ON")
    end
        toggle_gs = not toggle_gs
end

function sh6()
     if toggle_rs then
        setHexMemory("libcocos2dcpp.so", 0x18135E0, "F4 03 01 2A")
        gg.toast("リザルトスキップ OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x18135E0, "34 00 80 52")
        gg.toast("リザルトスキップ ON")
    end
        toggle_rs = not toggle_rs
end

function DD()
    local state_baisoku1 = toggle_baisoku1 and "倍速[1] OFF" or "倍速[1] ON"
    local state_baisoku2 = toggle_baisoku2 and "倍速[2] OFF" or "倍速[2] ON"
    local state_baisoku3 = toggle_baisoku3 and "倍速[3] OFF" or "倍速[3] ON"
    aa=gg.multiChoice({
        state_baisoku1,
        state_baisoku2,
        state_baisoku3,
        "戻る",
    })
    if aa == nil then return end
    if aa[1] == true then b1() end
    if aa[2] == true then b2() end
    if aa[3] == true then b3() end
    if aa[4] == true then Main() end
    if DD == nil then
        return
    end
end

function b1()
    if toggle_baisoku1 then
            setHexMemory("libcocos2dcpp.so", 0x200EF18, "40 18 20 1E")
            gg.toast("倍速[1] OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x200EF18, "00 D0 29 1E")
            gg.toast("倍速[1] ON")
    end
    toggle_baisoku1 = not toggle_baisoku1
end
function b2()
    if toggle_baisoku2 then
            setHexMemory("libcocos2dcpp.so", 0x200EF18, "40 18 20 1E")
            gg.toast("倍速[2] OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x200EF18, "00 90 20 1E")
            gg.toast("倍速[2] ON")
    end
    toggle_baisoku2 = not toggle_baisoku2
end
 function b3()
    if toggle_baisoku3 then
        setHexMemory("libcocos2dcpp.so", 0x200EF18, "40 18 20 1E")
        gg.toast("倍速[3] OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x200EF18, "00 10 24 1E")
        gg.toast("倍速[3] ON")
end
    toggle_baisoku3 = not toggle_baisoku3
end

function EE()
    local state_medal1 = toggle_medal1 and "メダル2万 OFF" or "メダル2万 ON"
    local state_medal2 = toggle_medal2 and "メダル1000万 OFF" or "メダル1000万 ON"
    local state_medal3 = toggle_medal3 and "メダル1億 OFF" or "メダル1億 ON"
    local state_medal4 = toggle_medal4 and "メダル2億 OFF" or "メダル2億 ON"
    bb=gg.multiChoice({
        state_medal1,
        state_medal2,
        state_medal3,
        state_medal4,
        "戻る",
    })
    if bb == nil then return end
    if bb[1] == true then me1() end
    if bb[2] == true then me2() end
    if bb[3] == true then me3() end
    if bb[4] == true then me4() end
    if bb[5] == true then Main() end
    if EE == nil then
        return
    end
end

function me1()
    if toggle_medel1 then
            setHexMemory("libcocos2dcpp.so", 0x1834150, "F4 03 01 2A")
            gg.toast("メダル2万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x1834150, "14 C4 89 52")
            gg.toast("メダル2万 ON")
    end
    toggle_medal1 = not toggle_medal1
end
function me2()
    if toggle_medal2 then
            setHexMemory("libcocos2dcpp.so", 0x1834150, "F4 03 01 2A")
            gg.toast("メダル1000万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x1834150, "34 13 A0 52")
            gg.toast("メダル1000万 ON")
    end
    toggle_medal2 = not toggle_medal2
end
 function me3()
    if togglemedal3 then
        setHexMemory("libcocos2dcpp.so", 0x1834150, "F4 03 01 2A")
        gg.toast("メダル1億 OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x1834150, "14 C0 A0 52")
        gg.toast("メダル1億 ON")
end
    toggle_medal3 = not toggle_medal3
end
function me4()
    if toggle_medal4 then
        setHexMemory("libcocos2dcpp.so", 0x1834150, "F4 03 01 2A")
        gg.toast("メダル2億 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x1834150, "14 C4 89 52")
        gg.toast("メダル2億 ON")
end
    
    toggle_medal4 = not toggle_medal4
end

function exit()
    gg.toast("終了!")
    gg.clearResults()
    os.exit()
end
 


 
 
while true do
    if gg.isVisible() then
        gg.setVisible(false)
        Main()
    end

end
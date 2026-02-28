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

gg.alert("ScriptDeveloper：きょう", 'start')
function Main()
	local menu = gg.choice({
        "コインメニュー",
        "メダルメニュー", 
        "メインメニュー",
        "スクリプト終了",
    }, nil, "ScriptDeveloper：きょう\nTumuTumuScript" .. gg.getTargetInfo().versionName)

    if menu == nil then
        return
    else
        if menu == 1 then BB() end
        if menu == 2 then CC() end
        if menu == 3 then DD() end
        if menu == 4 then exit() end
    end
end
--CoinMenu--
toggle_coin1 = false 
toggle_coin2 = false
toggle_coin3 = false
toggle_coin4 = false
toggle_coin5 = false
toggle_coin6 = false
--MedalMenu--
toggle_Medal1 = false
toggle_Medal2 = false
toggle_Medal3 = false
toggle_Medal4 = false
toggle_Medal5 = false
toggle_Medal6 = false
--MainMENU--
state_soku = false
state_soku1 = false
state_tumumax = false
state_payermax = false
state_gs = false
state_rs = false

function BB()
    local state_coin1 = toggle_coin1 and "コイン50万 OFF" or "コイン50万 ON"
    local state_coin2 = toggle_coin2 and "コイン100万 OFF" or "コイン100万 ON"
    local state_coin3 = toggle_coin3 and "コイン1000万 OFF" or "コイン1000万 ON"
    local state_coin4 = toggle_coin4 and "コイン5000万 OFF" or "コイン5000万 ON"
    local state_coin5 = toggle_coin5 and "コイン1億 OFF" or "コイン1億 ON"
    local state_coin6 = toggle_coin6 and "コイン2億 OFF" or "コイン2億 ON"
    ww=gg.multiChoice({
        state_coin1,
        state_coin2,
        state_coin3,
        state_coin4,
        state_coin5,
        state_coin6,
        "戻る",
    })
    if ww == nil then return end
    if ww[1] == true then m1() end
    if ww[2] == true then m2() end
    if ww[3] == true then m3() end
    if ww[4] == true then m4() end
    if ww[5] == true then m5() end
    if ww[6] == true then m5() end
    if ww[7] == true then Main() end
    if BB == nil then
        return
    end
end

function m1()
    if toggle_coin1 then
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("コイン50万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "D1 D2 F8 17")
            gg.toast("コイン50万 ON")
    end
    toggle_coin1 = not toggle_coin1
end
function m2()
    if toggle_coin2 then
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("コイン100万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 48 88 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 01 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "D1 D2 F8 17")
            gg.toast("コイン100万 ON")
    end
    toggle_coin2 = not toggle_coin2
end
 function m3()
    if toggle_coin3 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("コイン1000万 OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 D0 92 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "18 10 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "FE D2 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("コイン1000万 ON")
end
    toggle_coin3 = not toggle_coin3
end
function m4()
    if toggle_coin4 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("コイン5000万 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 10 9E  52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "58 5F A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "FE D2 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("コイン5000万 ON")
end
    
    toggle_coin4 = not toggle_coin4
end

function m5()
    if toggle_coin5 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("コイン1億 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 20 9C 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "B8 BE A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "FE 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("コイン1億 ON")
end
    
    toggle_coin5 = not toggle_coin5
end

function m6()
    if toggle_coin6 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("コイン2億 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 40 98 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "78 7D A1 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "FE D2 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "C9 89 F7 17")
        gg.toast("コイン2億 ON")
end
    
    toggle_coin6 = not toggle_coin6
end

function CC()
    local state_Medal1 = toggle_Medal1 and "メダル50万 OFF" or "メダル50万 ON"
    local state_Medal2 = toggle_Medal2 and "メダル100万 OFF" or "メダル100万 ON"
    local state_Medal3 = toggle_Medal3 and "メダル1000万 OFF" or "メダル1000万 ON"
    local state_Medal4 = toggle_Medal4 and "メダル5000万 OFF" or "メダル5000万 ON"
    local state_Medal5 = toggle_Medal5 and "メダル1億 OFF" or "メダル1億 ON"
    local state_Medal6 = toggle_Medal6 and "メダル2億 OFF" or "メダル2億 ON"
    aa=gg.multiChoice({
        state_Medal1,
        state_Medal2,
        state_Medal3,
        state_Medal4,
        state_Medal5,
        state_Medal6,
        "戻る",
    })
    if aa == nil then return end
    if aa[1] == true then M1() end
    if aa[2] == true then M2() end
    if aa[3] == true then M3() end
    if aa[4] == true then M4() end
    if aa[5] == true then M5() end
    if aa[6] == true then M6() end
    if aa[7] == true then Main() end
    if CC == nil then
        return
    end
end

function M1()
    if toggle_Medal1 then
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("メダル50万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "7A 2F F8 17")
            gg.toast("メダル50万 ON")
    end
    toggle_Medal1 = not toggle_Medal1
end
function M2()
    if toggle_Medal2 then
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("メダル100万 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "7A 2F F8 17")
            gg.toast("メダル100万 ON")
    end
    toggle_Medal2 = not toggle_Medal2
end
 function M3()
    if toggle_Medal3 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
            gg.toast("メダル1000万 OFF")
    else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("メダル1000万 ON")
end
    toggle_Medal3 = not toggle_Medal3
end
function M4()
    if toggle_Medal4 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("メダル5000万 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("メダル5000万 ON")
end
    
    toggle_Medal4 = not toggle_Medal4
end

function M5()
    if toggle_Medal5 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("メダル1億 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "01 2D F8 17")
        gg.toast("メダル1億 ON")
end
    
    toggle_Medal5 = not toggle_Medal5
end

function M6()
    if toggle_Medal6 then
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "F8 03 01 2A")
        gg.toast("メダル2億 OFF")
        else
        setHexMemory("libcocos2dcpp.so", 0x187423C, "18 24 94 52")
            setHexMemory("libcocos2dcpp.so", 0x1874240, "F8 00 A0 72")
            setHexMemory("libcocos2dcpp.so", 0x1874244, "2E 2D 07 14")
            setHexMemory("libcocos2dcpp.so", 0x1874248, "1F 20 03 D5")
            setHexMemory("libcocos2dcpp.so", 0x1A3F6F8, "C9 89 F7 17")
        gg.toast("メダル2億 ON")
end
    
    toggle_Medal6 = not toggle_Medal6
end

function DD()
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
    if DD == nil then
        return
    end
end

function sh1()
    if toggle_soku then
            setHexMemory("libcocos2dcpp.so", 0x23204C8, "00 20 21 1E")
            gg.toast("即終了 OFF")
            else
            setHexMemory("libcocos2dcpp.so", 0x23204C8, "00 10 24 1E")
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
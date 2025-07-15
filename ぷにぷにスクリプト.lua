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

local startAddress, endAddress = isim({"split_config.arm64_v8a.apk", "libSGF"})

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
        "基本メニュー",
        "倍速メニュー",
        "遅延メニュー",
        "無効メニュー",
        "スクリプト終了",
    }, nil, "スクリプト制作：きょう\nぷにぷにスクリプトv" .. gg.getTargetInfo().versionName)

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
--MainMenu--
toggle_wanpan = false 
toggle_muteki = false
toggle_9man = false
toggle_100man = false
toggle_scoreMAX = false
toggle_resultskip = false
toggle_keiryou = false
--スピードMENU--
state_baisoku1 = false
state_baisoku2 = false
state_baisoku3 = false
state_baisoku4 = false
--遅延MENU--
state_tienn1 = false
state_tienn2 = false
state_tienn3 = false
state_tienn4 = false
--無効化menu--
state_kaiwa = false
state_mushimegane = false
state_fuin = false
state_kagi = false
state_oshirase = false
state_rogubo = false

function BB()
    local state_wanpan = toggle_wanpan and "ワンパン OFF" or "ワンパン ON"
    local state_muteki = toggle_muteki and "無敵 OFF" or "無敵 ON"
    local state_9man = toggle_9man and "9万 OFF" or "9万 ON"
    local state_100man = toggle_100man and "100万 OFF" or "100万 ON"
    local state_scoreMAX = toggle_scoreMAX and "スコアMAX 1.6億 OFF" or "スコア1.6億 ON"
    local state_resultskip = toggle_resultskip and "リザルトスキップ OFF" or "リザルトスキップ ON"
    local state_keiryou = toggle_keiryou and "軽量化 OFF" or "軽量化 ON"
    ww=gg.multiChoice({
        state_wanpan,
        state_muteki,
        state_9man,
        state_100man,
        state_scoreMAX,
        state_resultskip,
        state_keiryou,
        "戻る",
    })
    if ww == nil then return end
    if ww[1] == true then m1() end
    if ww[2] == true then m2() end
    if ww[3] == true then m3() end
    if ww[4] == true then m4() end
    if ww[5] == true then m5() end
    if ww[6] == true then m6() end
    if ww[7] == true then m7() end
    if ww[8] == true then Main() end
    if BB == nil then
        return
    end
end

function m1()
    if toggle_wanpan then
            setHexMemory("libSGF.so", 0x325E83C, "81 00 00 54")
            gg.toast("ワンパン OFF")
            else
            setHexMemory("libSGF.so", 0x325E83C, "80 00 00 54")
            gg.toast("ワンパン ON")
    end
    toggle_wanpan = not toggle_wanpan
end
function m2()
    if toggle_muteki then
            setHexMemory("libSGF.so", 0x345BEC4, "E1 07 40 B9")
            gg.toast("無敵 OFF")
            else
            setHexMemory("libSGF.so", 0x345BEC4, "00 08 21 1E")
            gg.toast("無敵 ON")
    end
    toggle_muteki = not toggle_muteki
end
 function m3()
    if toggle_9man then
        setHexMemory("libSGF.so", 0x325E83C, "F3 03 01 2A")
        gg.toast("9万ダメージ OFF")
    else
        setHexMemory("libSGF.so", 0x325E83C, "F3 07 11 32")
        gg.toast("9万ダメージ ON")
end
    toggle_9man = not toggle_9man
end
function m4()
    if toggle_100man then
        setHexMemory("libSGF.so", 0x325E83C, "F3 03 01 2A")
        gg.toast("100万ダメージ OFF")
        else
        setHexMemory("libSGF.so", 0x325E83C, "13 02 A0 52")
        gg.toast("100万ダメージ ON")
end
    
    toggle_100man = not toggle_100man
end
function m5()
     if toggle_scoreMAX then
        setHexMemory("libSGF.so", 0x3458130, "01 00 14 8B")
        gg.toast("スコア1.6億 OFF")
        else
        setHexMemory("libSGF.so", 0x3458130, "41 31 A1 D2")
        gg.toast("スコア1.6億 ON")
    end
        toggle_scoreMAX = not toggle_scoreMAX
end
function m6()
     if toggle_resultskipMAX then
        setHexMemory("libSGF.so", 0x344B2D8, "21 70 00 54")
        gg.toast("リザルトスキップ OFF")
        else
        setHexMemory("libSGF.so", 0x344B2D8, "CO 69 00 54")
        gg.toast("リザルトスキップ ON")
    end
        toggle_resultskip = not toggle_resultskip
end
function m7()
     if toggle_keiryou then
        setHexMemory("libSGF.so", 0x28FC2C4, "81 00 80 52")
        gg.toast("軽量化 OFF")
        else
        setHexMemory("libSGF.so", 0x28FC2C4, "81 62 80 52")
        gg.toast("軽量化 ON")
    end
        toggle_keiryou = not toggle_keiryou
end

function CC()
    local state_baisoku1 = toggle_baisoku1 and "倍速[1] OFF" or "倍速[1] ON"
    local state_baisoku2 = toggle_baisoku2 and "倍速[2] OFF" or "倍速[2] ON"
    local state_baisoku3 = toggle_baisoku3 and "倍速[3] OFF" or "倍速[3] ON"
    local state_baisoku4 = toggle_baisoku4 and "倍速[4] OFF" or "倍速[4] ON"
    xx=gg.multiChoice({
        state_baisoku1,
        state_baisoku2,
        state_baisoku3,
        state_baisoku4,
        "戻る",
    })
    if xx == nil then return end
    if xx[1] == true then sh1() end
    if xx[2] == true then sh2() end
    if xx[3] == true then sh3() end
    if xx[4] == true then sh4() end
    if xx[5] == true then Main() end
    if CC == nil then
        return
    end
end

function sh1()
    if toggle_baisoku1 then
            setHexMemory("libSGF.so", 0x29202D4, "EB FE FF 54")
            gg.toast("倍速[1] OFF")
            else
            setHexMemory("libSGF.so", 0x29202D4, "00 10 28 1E")
            gg.toast("倍速[1] ON")
    end
    toggle_baisoku1 = not toggle_baisoku2
end
 function sh2()
    if toggle_baisoku2 then
        setHexMemory("libSGF.so", 0x29202D4, "EB FE FF 54")
        gg.toast("倍速[2] OFF")
    else
        setHexMemory("libSGF.so", 0x29202D4, "00 90 28 1E")
        gg.toast("倍速[2] ON")
end
    toggle_baisoku2 = not toggle_baisoku2
end
function sh3()
    if toggle_baisoku3 then
        setHexMemory("libSGF.so", 0x29202D4, "EB FE FF 54")
        gg.toast("倍速[3] OFF")
        else
        setHexMemory("libSGF.so", 0x29202D4, "00 90 29 1E")
        gg.toast("倍速[3] ON")
end
    
    toggle_baisoku3 = not toggle_baisoku3
end
function sh4()
     if toggle_baisoku4 then
        setHexMemory("libSGF.so", 0x29202D4, "EB FE FF 54")
        gg.toast("倍速[4] OFF")
        else
        setHexMemory("libSGF.so", 0x29202D4, "00 10 2E 1E")
        gg.toast("倍速[4] ON")
    end
        toggle_baisoku4 = not toggle_baisoku4
end


function DD()
    local state_tienn1 = toggle_tienn1 and "遅延[1] OFF" or "遅延[1] ON"
    local state_tienn2 = toggle_tienn2 and "遅延[2] OFF" or "遅延[2] ON"
    local state_tienn3 = toggle_tienn3 and "遅延[3] OFF" or "遅延[3] ON"
    local state_tienn4 = toggle_tienn4 and "遅延[4] OFF" or "遅延[4] ON"
    
    zz=gg.multiChoice({
        state_tienn1,
        state_tienn2,
        state_tienn3,
        state_tienn4,
        "戻る",
    })
    if zz == nil then return end
    if zz[1] == true then t1() end
    if zz[2] == true then t2() end
    if zz[3] == true then t3() end
    if zz[4] == true then t4() end
    if zz[5] == true then Main() end

    if DD == nil then
        return
    end
end
function t1()
    if toggle_tienn1 then
            setHexMemory("libSGF.so", 0x3080A00, "00 18 28 1E")
            gg.toast("遅延[1] OFF")
            else
            setHexMemory("libSGF.so", 0x3080A00, "00 70 2A 1E")
            gg.toast("遅延[1] ON")
end
            toggle_tienn1 = not toggle_tienn1
end
function t2()
    if toggle_tienn2 then
        setHexMemory("libSGF.so", 0x3080A00, "00 18 28 1E")
        gg.toast("遅延[2] OFF")
        else
        setHexMemory("libSGF.so", 0x3080A00, "00 50 29 1E")
        gg.toast("遅延[2] ON")
    end
    toggle_tienn2 = not toggle_tienn2
end

function t3()
    if toggle_tienn3 then
        setHexMemory("libSGF.so", 0x3080A00, "00 18 28 1E")
        gg.toast("遅延[3] OFF")
        else
        setHexMemory("libSGF.so", 0x3080A00, "00 D0 28 1E")
        gg.toast("遅延[3] ON")
    end
    toggle_tienn3 = not toggle_tienn3
end

function t4()
    if toggle_tienn4 then
        setHexMemory("libSGF.so", 0x3080A00, "00 18 28 1E")
        gg.toast("遅延[4] OFF")
        else
        setHexMemory("libSGF.so", 0x3080A00, "00 10 28 1E")
        gg.toast("遅延[4] ON")
    end
    toggle_tienn4 = not toggle_tienn4
end

function EE()
local state_kaiwa = toggle_kaiwa and "会話無効 OFF" or "会話無効 ON"
    local state_mushimegane = toggle_mushimegane and "虫眼鏡無効 OFF" or "虫眼鏡無効 ON"
    local state_fuin = toggle_fuin and "封印無効 OFF" or "封印無効 ON"
    local state_kagi = toggle_kagi and "鍵演出無効 OFF" or "鍵演出無効 ON"
    local state_oshirase = toggle_oshirase and "お知らせ無効 OFF" or "お知らせ無効 ON"
    local state_rogubo = toggle_rogubo and "ログインボーナス無効 OFF" or "ログインボーナス無効 ON"
    aa=gg.multiChoice({
        state_kaiwa,
        state_mushimegane,
        state_fuin,
        state_kagi,
        state_oshirase,
        state_rogubo,
        "戻る",
    })
    if aa == nil then return end
    if aa[1] == true then d1() end
    if aa[2] == true then d2() end
    if aa[3] == true then d3() end
    if aa[4] == true then d4() end
    if aa[5] == true then d5() end
    if aa[6] == true then d6() end
    if aa[7] == true then Main() end

    if EE == nil then
        return
    end
end
function d1()
    if toggle_kaiwa then
            setHexMemory("libSGF.so", 0x3F8F1D4, "FF 83 01 D1")
            gg.toast("会話無効 OFF")
            else
            setHexMemory("libSGF.so", 0x3F8F1D4, "C0 03 5F D6")
            gg.toast("会話無効 ON")
end
            toggle_kaiwa = not toggle_kaiwa
end
function d2()
    if toggle_mushimegane then
        setHexMemory("libSGF.so", 0x3B8CD78, "FF 83 81 D1")
        gg.toast("虫眼鏡無効 OFF")
        else
        setHexMemory("libSGF.so", 0x3B8CD78, "C0 03 5F D6")
        gg.toast("虫眼鏡無効 ON")
    end
    toggle_mushimegane = not toggle_mushimegane
end

function d3()
    if toggle_fuin then
        setHexMemory("libSGF.so", 0x3BA9834, "FF 43 04 D1")
        gg.toast("封印無効 OFF")
        else
        setHexMemory("libSGF.so", 0x3BA9834, "C0 03 5F D6")
        gg.toast("封印無効 ON")
    end
    toggle_fuin = not toggle_fuin
end

function d4()
    if toggle_kagi then
        setHexMemory("libSGF.so", 0x3F670B8, "01 09 40 B9")
        gg.toast("鍵演出無効 OFF")
        else
        setHexMemory("libSGF.so", 0x3F670B8, "18 00 00 14")
        gg.toast("鍵演出無効 ON")
    end
    toggle_kagi = not toggle_kagi
end

function d5()
    if toggle_oshirase then
        setHexMemory("libSGF.so", 0x3F5D6B0, "28 02 00 34")
        gg.toast("お知らせ無効 OFF")
        else
        setHexMemory("libSGF.so", 0x3F5D6B0, "11 00 00 14")
        gg.toast("お知らせ無効 ON")
    end
    toggle_oshirase = not toggle_oshirase
end

function d6()
    if toggle_rogubo then
        setHexMemory("libSGF.so", 0x3F65E24, "48 07 00 34")
        gg.toast("ログインボーナス無効 OFF")
        else
        setHexMemory("libSGF.so", 0x3F65E24, "3A 00 00 14")
        gg.toast("ログインボーナス無効 ON")
    end
    toggle_rogubo = not toggle_rogubo
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
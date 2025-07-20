local config = {}
local configKeys = {}
local savedConfigs = {} 

local subConfigs = {
    Main = {
        {
            Func = function(value) Baisokuu(value) end,
            Type = "InputValue",
            Name = "倍速[1;5]",
            value = 1,
            State = true,
        },
        {
            Func = function(value) Tienn(value) end,
            Type = "InputValue",
            Name = "遅延[1;4]",
            value = 1,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "1.5倍速",
            lib = "libSGF.so",
            Offset = 0x32DC260,
            ONHex = "00 28 28 1E",
            OFFHex = "EB FE FF 54",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ワンパン",
            lib = "libSGF.so",
            Offset = 0x3C249A8,
            ONHex = "80 00 00 54",
            OFFHex = "81 00 00 54",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "9万ワンパン",
            lib = "libSGF.so",
            Offset = 0x3B7AE6C,
            ONHex = "F3 07 11 32",
            OFFHex = "F3 03 01 2A",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "無敵",
            lib = "libSGF.so",
            Offset = 0x3E37498,
            ONHex = "00 08 21 1E",
            OFFHex = "E1 07 40 B9",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "軽量化",
            lib = "libSGF.so",
            Offset = 0x3217828,
            ONHex = "81 62 80 52",
            OFFHex = "81 00 80 52",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "リザルトスキップ",
            lib = "libSGF.so",
            Offset = 0x3E26778,
            ONHex = "1F 04 00 71",
            OFFHex = "1F 08 00 71",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "無効化一括",
            lib = "libSGF.so",
            Offset = {0x45E7BBC,
                      0x4A1E398,--キャラクター無効
                      0x494695C,--フレアイコン
                      0x49EB5C8,
                      0x49F48A0,
                      0x493D89C,
                      0x494695C,
                      0x4947CE8}, 
            ONHex = {"C0 03 5F D6",
                      "C0 03 5F D6",--キャラクター無効
                      "C0 03 5F D6",
                      "C0 03 5F D6",
                      "C0 03 5F D6",
                      "29 02 00 35",
                      "68 07 00 35",
                      "21 03 00 35"},
            OFFHex = {"FF 83 03 D1",
                       "FF 83 01 D1",--キャラクター無効
                       "FF 03 03 D1",
                       "FF 83 06 D1",
                       "FF 43 04 D1",
                       "28 02 00 34",
                       "68 07 00 34",
                       "21 03 00 34",
                       },
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "スコアカンスト",
            lib = "libSGF.so",
            Offset = 0x3E33604,
            ONHex = "01 AC 15 8B",
            OFFHex = "01 00 15 8B",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = function() MainMenu() end,
            Type = "Toggle",
            Name = "戻る",
            value = false,
            State = true,
        }
    },
    Puzzle = {
        {
            Func = nil,
            Type = "Toggle",
            Name = "即勝利",
            lib = "libSGF.so",
            Offset = 0x3E35CC4,
            ONHex = "41 01 00 54",
            OFFHex = "40 01 00 54",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "即フィーバー",
            lib = "libSGF.so",
            Offset = 0x3EEC758,
            ONHex = "3F 05 00 71",
            OFFHex = "3F 01 00 71",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "無限フィーバー",
            lib = "libSGF.so",
            Offset = 0x4F5CA40,
            ONHex = "3F 05 00 71",
            OFFHex = "3F 01 00 71",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "即技",
            lib = "libSGF.so",
            Offset = 0x58D8714,
            ONHex = "00 10 20 1E",
            OFFHex = "01 01 27 1E",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ボナ玉生成",
            lib = "libSGF.so",
            Offset = 0x4CC0D88,
            ONHex = "BF 01 0D 6B",
            OFFHex = "BF 01 08 6B",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "全ぷに繋がる",
            lib = "libSGF.so",
            Offset = 0x3BF8FC4,
            ONHex = "1F 20 03 D5",
            OFFHex = "80 FC 07 36",
            value = false,
            State = true,
        },
        {
            Func = function() MainMenu() end,
            Type = "Toggle",
            Name = "戻る",
            value = false,
            State = true,
        }
    },
    Disable = {
        {
            Func = nil,
            Type = "Toggle",
            Name = "キャラクター無効",
            lib = "libSGF.so",
            Offset = 0x4A1E398,
            ONHex = "C0 03 5F D6",
            OFFHex = "FF 83 01 D1",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "虫眼鏡無効",
            lib = "libSGF.so",
            Offset = 0x45E7BBC,
            ONHex = "C0 03 5F D6",
            OFFHex = "FF 83 06 D1",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "フレアイコン無効",
            lib = "libSGF.so",
            Offset = 0x44e5744,
            ONHex = "C0 03 5F D6",
            OFFHex = "FF 03 03 D1",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "封印無効",
            lib = "libSGF.so",
            Offset = 0x47C13C4,
            ONHex = "C0 03 5F D6",
            OFFHex = "FF 43 04 D1",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "鍵演出無効",
            lib = "libSGF.so",
            Offset = 0x4947CE8,
            ONHex = "21 03 00 35",
            OFFHex = "21 03 00 34",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "お知らせ無効",
            lib = "libSGF.so",
            Offset = 0x49EB5C8,
            ONHex = "28 02 00 35",
            OFFHex = "28 02 00 34",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "スコアタランキング無効",
            lib = "libSGF.so",
            Offset = 0x49F48A0,
            ONHex = "28 03 00 35",
            OFFHex = "28 03 00 34",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ゲート演出無効",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "トーナメント無効",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ログインスタンプ無効",
            lib = "libSGF.so",
            Offset = 0x494695C,
            ONHex = "68 07 00 35",
            OFFHex = "68 07 00 34",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ランキングボタン無効",
            lib = "libSGF.so",
            Offset = 0x44E0BD8,
            ONHex = "C0 03 5F D6",
            OFFHex = "FD 7B BA A9",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = function() MainMenu() end,
            Type = "Toggle",
            Name = "戻る",
            value = false,
            State = true,
        }
    },
    Other = {
        {
            Func = function() SubMenu("Choicess") end,
            Type = "Toggle",
            Name = "高度な倍速+遅延指定",
            value = false,
            State = true,
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "104万ダメ",
            lib = "libSGF.so",
            Offset = 0x3B7AE6C,
            ONHex = "13 02 A0 52",
            OFFHex = "F3 03 01 2A",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "イベステゆうびん解放",
            lib = "libSGF.so",
            Offset = {0x4761C90,
                      0x44e01cc}, 
            ONHex = {"E1 03 1F 2A",
                      "C0 03 5F D6"},
            OFFHex = {"21 00 80 52",
                       "FF 03 01 D1"},
            value = false,
            State = true,
            ToggleStatus = true
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "チュートリアル無効",
            lib = "libSGF.so",
            Offset = 0x5151274,
            ONHex = "00 00 00 00",
            OFFHex = "01 01 01 01",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "スコアタ時間停止",
            lib = "libSGF.so",
            Offset = 0x395BE40,
            ONHex = "20 00 80 52",
            OFFHex = "E0 03 13 2A",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "ログアウト[全機種対応]",
            lib = "libSGF.so",
            Offset = 0x37D6A18,
            ONHex = "D4 00 00 B4",
            OFFHex = "D4 00 00 B5",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = function() SaveMenus() end,
            Type = "Toggle",
            Name = "機能保存",
            value = false,
            State = true,
        },
        {
            Func = function() PopMenus() end,
            Type = "Toggle",
            Name = "機能復元",
            value = false,
            State = true,
        },
        {
            Func = function() toggleAutoSave() end,
            Type = "Toggle",
            Name = "自動保存+自動復元",
            value = false,
            State = true,
        },
        {
            Func = function() EndApps() end,
            Type = "Toggle",
            Name = "アプリ終了",
            value = false,
            State = true,
        },
        {
            Func = function() MainMenu() end,
            Type = "Toggle",
            Name = "戻る",
            value = false,
            State = true,
        }
    },

    Drop = {
        {
            Func = nil,
            Type = "Toggle",
            Name = "妖怪確定ドロップ",
            lib = "libSGF.so",
            Offset = 0x3956FB8,
            ONHex = "20 00 80 52",
            OFFHex = "E0 03 1F 2A",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "確定ドロップ無効",
            lib = "libSGF.so",
            Offset = 0x3956F64,
            ONHex = "33 00 80 52",
            OFFHex = "F3 03 1F 2A",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "アイテムドロップ無効",
            lib = "libSGF.so",
            Offset = 0x3956B9C,
            ONHex = "C0 03 5F D6",
            OFFHex = "FD 7B BC A9",
            value = false,
            State = true,
            ToggleStatus = false
        },
        {
            Func = nil,
            Type = "Toggle",
            Name = "鍵ドロップ無効",
            lib = "libSGF.so",
            Offset = 0x3F54924,
            ONHex = "E2 03 1F 2A",
            OFFHex = "E2 03 00 2A",
            value = false,
            State = true,
            ToggleStatus = false 
        },
        {
            Func = function() MainMenu() end,
            Type = "Toggle",
            Name = "戻る",
            value = false,
            State = true,
        }
    }
}



function Baisokuu(value)
    local hexValues = {
        [1] = "EB FE FF 54",
        [2] = "00 10 28 1E",
        [3] = "00 90 28 1E",
        [4] = "00 90 29 1E",
        [5] = "00 10 2E 1E"
    }

    if hexValues[value] then
        setHexMemory("libSGF.so", 0x29322A4, hexValues[value])
        gg.toast("倍速: " .. (value == 1 and "OFF" or value .. "倍速を設定しました。"))
    else
        gg.alert("エラー: 無効な倍速値です！ (入力値: " .. tostring(value) .. ")")
    end
end

function Tienn(value)
    local hexValues = {
        [1] = "00 18 28 1E",
        [2] = "00 50 2A 1E",
        [3] = "00 D0 28 1E",
        [4] = "00 10 28 1E"
    }

    if hexValues[value] then
        setHexMemory("libSGF.so", 0x3A3E9D0, hexValues[value])
        gg.toast("遅延: " .. (value == 1 and "OFF" or value .. "を設定しました。"))
    else
        gg.alert("エラー: 無効な遅延値です！ (入力値: " .. tostring(value) .. ")")
    end
end


function EndApps()
gg.processKill()
os.exit()
end

function restoreSettings()
    for i, settingItem in ipairs(settings) do
        if settingItem.State then
            local hexValues = settingItem.State and settingItem.ONHex or settingItem.OFFHex
            for j, offset in ipairs(settingItem.Offset) do
                local hexValue = hexValues[j]
                local value = tonumber(hexValue, 16)
                gg.setValues({{address = offset, value = value, flags = gg.TYPE_DWORD}})
            end
        end
    end
end

function isim(lib)
    local savedLib = loadSavedLibrary()
    if savedLib then
        lib = savedLib
    end
    local ranges = gg.getRangesList(lib or 'libSGF.so')
    if #ranges == 0 then
        gg.alert("Error: 指定されたライブラリ (" .. lib .. ") が見つかりません。代用ライブラリ arm64_v8a.apk を使用します。")
        lib = 'arm64_v8a.apk'
        ranges = gg.getRangesList(lib)
        if #ranges > 0 then
            lib = ranges[1].name
            saveLibrary(lib)
        else
            gg.alert("Error: 代用ライブラリ arm64_v8a.apk にライブラリが見つかりません。")
            lib = 'libSGF.so'
            saveLibrary(lib)
            return nil, nil
        end
    end
    if #ranges == 0 then
        gg.alert("Error: 代用ライブラリ " .. lib .. " が見つかりません。")
        gg.alert("元のライブラリ " .. 'libSGF.so' .. " を再度利用します。")
        lib = 'libSGF.so'
        saveLibrary(lib)
        return nil, nil
    end
    for _, range in ipairs(ranges) do
        if range.state == "Xa" then
            startAddress = range.start
            endAddress = range['end']
            return startAddress, endAddress
        end
    end
    gg.alert("Error: " .. lib .. " の範囲が見つかりません。")
    gg.alert("元のライブラリ " .. 'libSGF.so' .. " を再度利用します。")
    lib = 'libSGF.so'
    saveLibrary(lib)
    return nil, nil
end

function saveLibrary(lib)
    local filePath = "/storage/emulated/0/PuniChangeLibrary.lua"
    local file = io.open(filePath, "w")
    if file then
        file:write("return '" .. lib .. "'")
        file:close()
        gg.toast("ライブラリ " .. lib .. " が保存されました。")
    else
        gg.alert("エラー: ライブラリ情報の保存に失敗しました。")
    end
end

function loadSavedLibrary()
    local filePath = "/storage/emulated/0/PuniChangeLibrary.lua"
    local file = io.open(filePath, "r")
    if file then
        local savedData = file:read("*all")
        file:close()
        local success, lib = pcall(load(savedData))
        if success then
            return lib
        else
            gg.alert("エラー: 保存されたライブラリ情報の読み込みに失敗しました。")
            return nil
        end
    else
        return nil
    end
end

local function autoToggle(entry)
    if not entry.lib or not entry.Offset or not entry.ONHex or not entry.OFFHex then return end
    if type(entry.Offset) ~= "table" then
        entry.Offset = {entry.Offset}
    end
    if type(entry.ONHex) ~= "table" then
        entry.ONHex = {entry.ONHex}
    end
    if type(entry.OFFHex) ~= "table" then
        entry.OFFHex = {entry.OFFHex}
    end
    entry.value = not entry.value
    for i, offset in ipairs(entry.Offset) do
        local hex = entry.value and (entry.ONHex[i] or entry.ONHex[1]) or (entry.OFFHex[i] or entry.OFFHex[1])
        local success = setHexMemory(entry.lib, offset, hex)
        if not success then
        end
    end
    gg.toast(entry.Name .. (entry.value and " ⟬ON⟭" or " ⟬OFF⟭"))
end

function setHexMemory(libName, offset, hex)
    local startAddress = isim(libName)
    if not startAddress then return false end
    if type(offset) == "table" then
        offset = offset[1] or 0
    end
    if type(hex) == "table" then
        hex = table.concat(hex)
    end
    local values = {}
    local index = 0
    if type(hex) ~= "string" then
        gg.alert("エラー: hex値が文字列またはテーブルでないため処理できません。")
        return false
    end
    for byte in string.gmatch(hex, "%S%S") do
        table.insert(values, {address = startAddress + offset + index, flags = gg.TYPE_BYTE, value = byte .. "r"})
        index = index + 1
    end
    local success = gg.setValues(values)
    return type(success) ~= "string"
end

function editHexValues(entry)
    if type(entry.Offset) ~= "table" then
        entry.Offset = {entry.Offset}
    end
    if type(entry.ONHex) ~= "table" then
        entry.ONHex = {entry.ONHex}
    end
    if type(entry.OFFHex) ~= "table" then
        entry.OFFHex = {entry.OFFHex}
    end
    local prompts = {}
    local defaults = {}
    for i, offset in ipairs(entry.Offset) do
        table.insert(prompts, string.format("Offset 0x%X ONHex", offset))
        table.insert(defaults, entry.ONHex[i] or entry.ONHex[1])
        table.insert(prompts, string.format("Offset 0x%X OFFHex", offset))
        table.insert(defaults, entry.OFFHex[i] or entry.OFFHex[1])
    end
    local result = gg.prompt(prompts, defaults)
    if result then
        for i, offset in ipairs(entry.Offset) do
            entry.ONHex[i] = result[2 * i - 1]
            entry.OFFHex[i] = result[2 * i]
        end
        gg.toast("Hex値を更新しました！")
    else
        gg.alert("Hex値の変更をキャンセルしました。")
    end
end

function executeOnStart()
    local subMenus = getDynamicSubConfigs()
    for _, subMenu in ipairs(subMenus) do
        initializeConfig(subMenu)
        for _, key in ipairs(configKeys) do
            local entry = config[key]
            if entry.ToggleStatus == false then
            else
                if entry.Type == "Toggle" then
                    autoToggle(entry)
                elseif entry.Func then
                    entry.Func(entry.value)
                end
            end
        end
    end
end

function handleMenuResult(result)
    if not result then return false end
    local index = 1
    for _, key in ipairs(configKeys) do
        local entry = config[key]
        if entry then
            if entry.State then
                entry.ToggleStatus = false

                if entry.Type == "Toggle" then
                    if result[index] ~= entry.value then
                        if entry.Func then
                            entry.Func()
                        else
                            autoToggle(entry)
                        end
                    end
                elseif entry.Type == "InputValue" then
                    local numValue = tonumber(result[index])
                    if numValue and numValue ~= entry.value then
                        entry.value = numValue
                        if entry.Func then
                            entry.Func(numValue)
                        end
                    elseif not numValue then
                        gg.alert(entry.Name .. " の値が無効です")
                        return false
                    end
                end
            end
        end
        index = index + 1
    end
    return true
end

function initializeConfig(subMenu)
    if not savedConfigs[subMenu] then
        savedConfigs[subMenu] = {configKeys = {}, config = {}}
        local selectedConfig = subConfigs[subMenu]
        if not selectedConfig then
            gg.alert("Error: Undefined subMenu '" .. subMenu .. "'")
            return
        end
        for _, item in ipairs(selectedConfig) do
            if item.ToggleStatus == nil then
                item.ToggleStatus = false
            end
            savedConfigs[subMenu].config[item.Name] = item
            table.insert(savedConfigs[subMenu].configKeys, item.Name)
        end
    end

    config = savedConfigs[subMenu].config
    configKeys = savedConfigs[subMenu].configKeys
end

function getDynamicSubConfigs()
    local subMenuKeys = {}
    for subMenuName, _ in pairs(subConfigs) do
        table.insert(subMenuKeys, subMenuName)
    end
    return subMenuKeys
end

function generateMenu()
    local prompts, defaults, types = {}, {}, {}
    for _, key in ipairs(configKeys) do
        local entry = config[key]
        table.insert(prompts, entry.Name)
        table.insert(defaults, entry.value)
        table.insert(types, entry.Type == "Toggle" and "checkbox" or "number")
    end
    return prompts, defaults, types
end

function MainMenu()
    local menu = gg.choice({
    "Main Menu", 
    "Puzzle Menu", 
    "Disable Menu", 
    "Other Menu",
    "Drop Menu", 
    "機能復元",
    "スクリプト終了"}, nil, "めうすとScript\nぷにぷに 4.137.0")
    if menu == 1 then
        SubMenu("Main")
    elseif menu == 2 then
        SubMenu("Puzzle")
    elseif menu == 3 then
        SubMenu("Disable")
    elseif menu == 4 then
        SubMenu("Other")
    elseif menu == 5 then
        SubMenu("Drop")
    elseif menu == 6 then
        PopMenus()
    elseif menu == 7 then
        OnScriptExit()
        os.exit()
    end
end

function toggleAutoSave()
    local result = gg.alert("自動保存を有効にしますか？", "有効", "無効")
    
    if result == 1 then
        local saveFilePath = "/storage/emulated/0/PuniAutoSaveMenus.lua"

        local file = io.open(saveFilePath, "r")
        if file then
            file:close()
            gg.alert("自動保存はすでに有効です。")
        else
            autoSaveEnabled = true
            gg.alert("自動保存 + 自動復元を有効にしました。")
            SaveAutoSaveSettings()
        end
    else
        autoSaveEnabled = false
        local saveFilePath = "/storage/emulated/0/PuniAutoSaveMenus.lua"
        
        local file = io.open(saveFilePath, "r")
        if file then
            file:close()
            os.remove(saveFilePath)
            gg.alert("自動保存 + 自動復元を無効にしました。")
        else
            gg.alert("設定ファイルはすでに削除されています。")
        end
    end
end

function SaveAutoSaveSettings()
    local saveFilePath = "/storage/emulated/0/PuniAutoSaveMenus.lua"
    local savedData = {}

    for subMenuName, subMenuItems in pairs(subConfigs) do
        savedData[subMenuName] = {}
        for _, item in ipairs(subMenuItems) do
            table.insert(savedData[subMenuName], {
                Name = item.Name,
                Type = item.Type,
                Value = item.value
            })
        end
    end

    local file, err = io.open(saveFilePath, "w")
    if not file then
        gg.alert("エラー: 設定を保存できません。\n" .. err)
        return
    end

    local serializedData = "return " .. serializeTable(savedData)
    file:write(serializedData)
    file:close()
    gg.toast("自動保存設定が保存されました。")
end

function serializeTable(t)
    local serialized = "{"
    for key, value in pairs(t) do
        serialized = serialized .. "[" .. serializeValue(key) .. "] = " .. serializeValue(value) .. ","
    end
    serialized = serialized .. "}"
    return serialized
end

function serializeValue(value)
    if type(value) == "string" then
        return string.format("%q", value)
    elseif type(value) == "table" then
        return serializeTable(value)
    else
        return tostring(value)
    end
end

function OnScriptExit()
    local saveFilePath = "/storage/emulated/0/PuniAutoSaveMenus.lua"

    local file = io.open(saveFilePath, "r")
    if file then
        file:close()
        SaveAutoSaveSettings()
    else
    end
end

function AutoPopMenus()
    local saveFilePath = "/storage/emulated/0/PuniAutoSaveMenus.lua"
    local file = io.open(saveFilePath, "r")
    if not file then
        return
    end

    local fileContent = file:read("*all")
    file:close()

    local success, savedData = pcall(load(fileContent))
    if not success or type(savedData) ~= "table" then
        gg.alert("エラー: 保存された設定が無効です。\nデータを読み込めません。")
        return
    end

    for subMenuName, savedSubMenu in pairs(savedData) do
        local currentSubMenu = subConfigs[subMenuName]
        if currentSubMenu then
            for _, savedItem in ipairs(savedSubMenu) do
                for _, currentItem in ipairs(currentSubMenu) do
                    if currentItem.Name == savedItem.Name then
                        if currentItem.value ~= savedItem.Value then
                            currentItem.value = savedItem.Value
                            if currentItem.Type == "Toggle" then
                                if currentItem.Func then
                                    currentItem.Func()
                                else
                                    local hex = savedItem.Value and currentItem.ONHex or currentItem.OFFHex
                                    if type(currentItem.Offset) == "table" then
                                        for i, offset in ipairs(currentItem.Offset) do
                                            local success = setHexMemory(currentItem.lib, {offset}, hex[i])
                                            if not success then
                                                gg.alert("エラー: " .. currentItem.Name .. " の状態を変更できませんでした。")
                                            end
                                        end
                                    else
                                        local success = setHexMemory(currentItem.lib, {currentItem.Offset}, hex)
                                        if not success then
                                            gg.alert("エラー: " .. currentItem.Name .. " の状態を変更できませんでした。")
                                        end
                                    end
                                end
                            elseif currentItem.Type == "InputValue" then
                                if currentItem.Func then
                                    currentItem.Func(currentItem.value)
                                end
                            end
                        end
                        break
                    end
                end
            end
        else
            gg.alert("警告: サブメニュー '" .. subMenuName .. "' が見つかりません。スキップします。")
        end
    end

    gg.toast("保存された設定が復元されました。")
end

function serializeTable(tbl, indent)
    indent = indent or ""
    local result = "{\n"
    local nextIndent = indent .. "  "
    for key, value in pairs(tbl) do
        local formattedKey = type(key) == "string" and string.format("[%q]", key) or string.format("[%s]", key)
        if type(value) == "table" then
            result = result .. string.format("%s%s = %s,\n", nextIndent, formattedKey, serializeTable(value, nextIndent))
        else
            local formattedValue = type(value) == "string" and string.format("%q", value) or tostring(value)
            result = result .. string.format("%s%s = %s,\n", nextIndent, formattedKey, formattedValue)
        end
    end
    result = result .. indent .. "}"
    return result
end

function SaveMenus()
    local saveFilePath = "/storage/emulated/0/ぷにぷにSavedmenu.lua"
    local savedData = {}

    for subMenuName, subMenuItems in pairs(subConfigs) do
        savedData[subMenuName] = {}
        for _, item in ipairs(subMenuItems) do
            table.insert(savedData[subMenuName], {
                Name = item.Name,
                Type = item.Type,
                Value = item.value
            })
        end
    end

    local file = io.open(saveFilePath, "w")
    if not file then
        gg.alert("エラー: 設定を保存できません。\nファイルを開けませんでした。")
        return
    end

    file:write("return " .. serializeTable(savedData))
    file:close()

    gg.toast("機能が保存されました。")
end

function PopMenus()
    local saveFilePath = "/storage/emulated/0/ぷにぷにSavedmenu.lua"
    local file = io.open(saveFilePath, "r")
    if not file then
        return
    end

    local fileContent = file:read("*all")
    file:close()

    local success, savedData = pcall(load(fileContent))
    if not success or type(savedData) ~= "table" then
        gg.alert("エラー: 保存された設定が無効です。\nデータを読み込めません。")
        return
    end

    for subMenuName, savedSubMenu in pairs(savedData) do
        local currentSubMenu = subConfigs[subMenuName]
        if currentSubMenu then
            for _, savedItem in ipairs(savedSubMenu) do
                for _, currentItem in ipairs(currentSubMenu) do
                    if currentItem.Name == savedItem.Name then
                        if currentItem.value ~= savedItem.Value then
                            currentItem.value = savedItem.Value
                            if currentItem.Type == "Toggle" then
                                if currentItem.Func then
                                    currentItem.Func()
                                else
                                    local hex = savedItem.Value and currentItem.ONHex or currentItem.OFFHex
                                    if type(currentItem.Offset) == "table" then
                                        for i, offset in ipairs(currentItem.Offset) do
                                            local success = setHexMemory(currentItem.lib, {offset}, hex[i])
                                            if not success then
                                                gg.alert("エラー: " .. currentItem.Name .. " の状態を変更できませんでした。")
                                            end
                                        end
                                    else
                                        local success = setHexMemory(currentItem.lib, {currentItem.Offset}, hex)
                                        if not success then
                                            gg.alert("エラー: " .. currentItem.Name .. " の状態を変更できませんでした。")
                                        end
                                    end
                                end
                            elseif currentItem.Type == "InputValue" then
                                if currentItem.Func then
                                    currentItem.Func(currentItem.value)
                                end
                            end
                        end
                        break
                    end
                end
            end
        else
            gg.alert("警告: サブメニュー '" .. subMenuName .. "' が見つかりません。スキップします。")
        end
    end

    gg.toast("保存された設定が復元されました。")
end

function getDynamicSubConfigs()
    local subMenuKeys = {}
    for subMenuName, _ in pairs(subConfigs) do
        table.insert(subMenuKeys, subMenuName)
    end
    table.sort(subMenuKeys)
    return subMenuKeys
end

function serializeTable(tbl, depth)
    depth = depth or 0
    local indent = string.rep("    ", depth)
    local lines = {"{"}

    for k, v in pairs(tbl) do
        local key = type(k) == "string" and string.format("%q", k) or k
        local value
        if type(v) == "table" then
            value = serializeTable(v, depth + 1)
        elseif type(v) == "string" then
            value = string.format("%q", v)
        else
            value = tostring(v)
        end
        table.insert(lines, indent .. "    [" .. key .. "] = " .. value .. ",")
    end

    table.insert(lines, indent .. "}")
    return table.concat(lines, "\n")
end

function SubMenu(subMenu)
    initializeConfig(subMenu)
    local prompts, defaults, types = generateMenu()
    local result = gg.prompt(prompts, defaults, types)
    if not handleMenuResult(result) then return end
end

executeOnStart()
loadSavedLibrary()
AutoPopMenus()

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        MainMenu()
    end
    gg.sleep(100)
end
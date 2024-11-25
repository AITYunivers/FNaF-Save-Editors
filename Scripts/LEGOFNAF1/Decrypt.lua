--  C# Passes in:
--      Dictionary<string, bool> Conditions
--          The conditions used by EditorType ConditionStart and ConditionEnd
--      EditorData EditorData
--          The data of the Editor.jsons
--      EditorData.ValueData CallerData
--          The data of the ValueData that called this script
--      object[] ScriptData
--          The data as specified in ValueData.ScriptData.Data
--      object GetData(EditorData.ValueData)
--          Gets the value of a ValueData
--      IFileLoader (EditorType)Data
--          Lets you read the data contained in the Save File
--      string ParsePath(string path)
--          Performs the path parser that parses [MMF], [APPDATA], etc.
--      void RefreshValues()
--          Refreshes the values of all save editor nodes
--      void RefreshView()
--          Refreshes the visibility of all save editor nodes

import ('Microsoft.Win32')

-- Attempt to read the username automatically
if not Conditions["Immediate"] then
    Conditions["Immediate"] = true;
    
    local possibleUsername = Registry.GetValue("HKEY_CURRENT_USER\\Software\\Valve\\Steam", "LastGameNameUsed", "No Name");
    EditorData.Config.IniData.EncryptionKey = "lego" .. possibleUsername;
    IniData:Load(EditorData);
    Conditions["Decrypted"] = IniData.Ini:GroupExists("lego");

    if Conditions["Decrypted"] then
        CallerData.ValueDefault = possibleUsername;
        CallerData.InputBoxData.DoReload = true;
    else
        EditorData.Config.IniData.EncryptionKey = "lego";
    end
else
    EditorData.Config.IniData.EncryptionKey = "lego" .. CallerData.InputBoxData.CurrentValue;
    IniData:Load(EditorData);
    Conditions["Decrypted"] = IniData.Ini:GroupExists("lego");
end

RefreshValues();
RefreshView();
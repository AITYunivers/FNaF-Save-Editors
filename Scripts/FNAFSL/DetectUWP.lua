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

import ('System.IO')

path = ParsePath("[LOCALAPPDATA]\\Packages\\ClickteamLLC.6244AF151C0_6hr7gq7xhprb4\\SystemAppData\\wgs\\000901FE5FE01A72_0000000000000000000000007DC2EF47")
if Directory.Exists(path) then
    Conditions["HasUWP"] = true
end
RefreshView();
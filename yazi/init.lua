require("zoxide"):setup {
    update_db = true,
}

-- Status:children_add(function()
--   local h = cx.active.current.hovered
--   if h == nil or ya.target_family() ~= "unix" then
--     return ui.Line {}
--   end
-- 
--   return ui.Line {
--     ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
--     ui.Span(":"),
--     ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
--     ui.Span(" "),
--   }
-- end, 500, Status.RIGHT)
-- 
-- function Status:name()
--   local h = self._tab.current.hovered
--   if not h then
--     return ui.Line {}
--   end
-- 
--   local linked = ""
--   if h.link_to ~= nil then
--     linked = " -> " .. tostring(h.link_to)
--   end
--   return ui.Span(" " .. h.name .. linked)
-- end

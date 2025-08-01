-- Simple script to check jsregexp status
print("Checking jsregexp availability...")

local ok, jsregexp = pcall(require, "luasnip-jsregexp")
if ok then
    print("✓ jsregexp is available and loaded successfully")
    print("  Advanced snippet transformations are enabled")
else
    print("✗ jsregexp is not available")
    print("  LuaSnip will work fine for basic snippets")
    print("  Advanced variable transformations will be limited")
end

-- Check if LuaSnip itself is working
local luasnip_ok, luasnip = pcall(require, "luasnip")
if luasnip_ok then
    print("✓ LuaSnip is loaded and working")
else
    print("✗ LuaSnip failed to load")
end

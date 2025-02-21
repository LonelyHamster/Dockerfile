-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/usr/local/openresty/luajit" };
}
variables = {
   LUA_DIR = "/usr/local/openresty/luajit";
   LUA_INCDIR = "/usr/local/openresty/luajit/include/luajit-2.1";
   LUA_BINDIR = "/usr/local/openresty/luajit/bin";
   LUA_VERSION = "5.1";
   LUA = "/usr/local/openresty/luajit/bin/luajit";
}

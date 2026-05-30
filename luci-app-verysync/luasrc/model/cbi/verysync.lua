require("luci.sys")
require("luci.model.uci")

m = Map("verysync", translate("Verysync"), 
	translate("Verysync is a efficient data synchronization tool. Web interface runs on port 8886 by default."))

s = m:section(TypedSection, "verysync", translate("Global Settings"))
s.anonymous = true
s.addremove = false

enable = s:option(Flag, "enabled", translate("Enable"), translate("Enable Verysync service"))
enable.rmempty = false
enable.default = "1"

port = s:option(Value, "port", translate("Web Interface Port"), translate("Port for the web interface (default: 8886)"))
port.datatype = "port"
port.default = "8886"
port.rmempty = false

gui_listen = s:option(Value, "gui_listen", translate("GUI Listen Address"), translate("Address to listen on (default: 0.0.0.0)"))
gui_listen.default = "0.0.0.0"
gui_listen.rmempty = false

config_dir = s:option(Value, "config_dir", translate("Config Directory"), translate("Directory to store configuration (default: /etc/verysync)"))
config_dir.default = "/etc/verysync"

return m
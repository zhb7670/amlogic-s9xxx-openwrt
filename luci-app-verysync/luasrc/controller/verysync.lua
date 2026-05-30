module("luci.controller.verysync", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/verysync") then
		return
	end
	
	local page = entry({"admin", "services", "verysync"}, alias("admin", "services", "verysync", "config"), _("Verysync"), 60)
	page.dependent = true
	page.acl_depends = { "acl-luci-app-verysync" }
	
	entry({"admin", "services", "verysync", "config"}, cbi("verysync"), _("Settings"), 10)
	entry({"admin", "services", "verysync", "status"}, call("action_status"), _("Status"), 20).leaf = true
end

function action_status()
	local sys = require "luci.sys"
	local uci = require "luci.model.uci".cursor()
	
	local status = {
		running = sys.call("pidof verysync >/dev/null") == 0,
		port = uci:get("verysync", "config", "port") or "8886"
	}
	
	luci.http.prepare_content("application/json")
	luci.http.write_json(status)
end
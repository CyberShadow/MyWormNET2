/*  Copyright (C) 2013, 2015, 2018, 2020  Vladimir Panteleev <vladimir@thecybershadow.net>
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module http;

import core.time;

import std.algorithm;
import std.array;
import std.datetime : SysTime, Clock;
import std.exception;
import std.conv;
import std.file;
import std.string;

import ae.net.http.server;
import ae.net.http.responseex;
import ae.utils.array;

import common;

alias std.string.indexOf indexOf;

class WormNETHttpServer
{
	HttpServer server;

	this()
	{
		server = new HttpServer;
		server.handleRequest = &onRequest;
	}

	struct Game
	{
		int id;
		string name;
		string host;
		string address;
		string password;
		string channel;
		string location;
		string type;
		SysTime created;
	}
	Game[] games;
	int gameCounter;

	enum gameTimeout = 5.minutes;

	void onRequest(HttpRequest request, HttpServerConnection conn)
	{
		auto response = new HttpResponseEx();
		auto now = Clock.currTime();

		try
		{
			auto pathStr = request.resource;
			enforce(pathStr.startsWith('/'), "Invalid path");
			UrlParameters parameters;
			if (pathStr.indexOf('?') >= 0)
			{
				auto p = pathStr.indexOf('?');
				parameters = decodeUrlParameters(pathStr[p+1..$]);
				pathStr = pathStr[0..p];
			}
			auto path = pathStr[1..$].split("/");

			if (path.length == 2 && path[0] == "wormageddonweb")
			{
				string html = "<NOTHING>";
				switch (path[1])
				{
					case "Login.asp":
						html = "<CONNECT %s%s>".format(
							configuration.irc.IP ? configuration.irc.IP : conn.tcp.localAddress.toAddrString,
							configuration.http.connectPort ? ":" ~ configuration.http.connectPort : "",
						);
						if (configuration.http.newsFileName.exists)
							html ~= "\r\n<MOTD>\r\n%s\r\n</MOTD>".format(configuration.http.newsFileName.readText);
						break;
					case "RequestChannelScheme.asp":
						html = "<SCHEME=%s>".format(configuration.channels.aaGet(parameters.aaGet("Channel")).scheme);
						break;
					case "Game.asp":
						switch (parameters.aaGet("Cmd"))
						{
							case "Create":
								gameCounter++;
								games ~= Game(
									gameCounter,
									parameters.aaGet("Name")[0..min($, 29)],
									parameters.aaGet("Nick"),
									parameters.aaGet("HostIP"),
									parameters.get("Pwd", null),
									parameters.aaGet("Chan"),
									parameters.aaGet("Loc"),
									parameters.aaGet("Type"),
									now,
								);
								response.headers["SetGameId"] = ": %d".format(gameCounter);
								break;
							case "Close":
							{
								auto id = parameters.aaGet("GameID").to!int;
								games = games.filter!(game => game.id != id).array;
								break;
							}
							case "Failed":
								break;
							default:
								return conn.sendResponse(response.writeError(HttpStatusCode.BadRequest));
						}
						break;
					case "GameList.asp":
						games = games.filter!(game => now - game.created < gameTimeout).array;
						html = "<GAMELISTSTART>\r\n" ~
							games
								.filter!(game => game.channel == parameters.aaGet("Channel"))
								.map!(game => "<GAME %s %s %s %s %d %d %d %s><BR>\r\n".format(
									game.name, game.host, game.address, game.location, 1 /* open */, game.password ? 1 : 0, game.id, game.type
								))
								.join() ~
							"<GAMELISTEND>\r\n";
						break;
					case "UpdatePlayerInfo.asp":
						break;
					default:
						return conn.sendResponse(response.writeError(HttpStatusCode.NotFound));
				}
				return conn.sendResponse(response.serveData(html));
			}
			else
				return conn.sendResponse(response.serveFile(pathStr[1..$], "wwwroot/"));
		}
		catch (FileException e)
			return conn.sendResponse(response.writeError(HttpStatusCode.NotFound           , e.msg));
		catch (Exception e)
			return conn.sendResponse(response.writeError(HttpStatusCode.InternalServerError, e.toString));
	}
}

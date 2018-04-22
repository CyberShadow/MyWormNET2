/*  Copyright (C) 2013, 2018  Vladimir Panteleev <vladimir@thecybershadow.net>
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

module mywormnet2;

import std.getopt;
import std.stdio;

import ae.net.asockets;
import ae.sys.log;
import ae.utils.sini;

import common;
import http;
import irc;

alias common.configuration configuration; // 314

class WormNETServer
{
	WormNETHttpServer http;
	WormNETIrcServer irc;
	Logger log;

	this()
	{
		http = new WormNETHttpServer;
		irc = new WormNETIrcServer;
	}

	void start()
	{
		irc.log = log;
		irc.listen(configuration.irc.port, configuration.irc.address);

		http.server.log = log;
		http.server.listen(configuration.http.port, configuration.http.address);
	}
}

bool quiet;

void main(string[] args)
{
	getopt(args,
		"q", &quiet,
	);

	configuration = File("mywormnet2.ini").byLine.parseStructuredIni!Configuration;

	auto server = new WormNETServer();
	server.log = quiet ? new FileLogger("MyWormNET2") : new FileAndConsoleLogger("MyWormNET2");
	server.start();
	socketManager.loop();
}

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

module common;

struct Configuration
{
	struct IRC
	{
		string hostname;
		string address = null;
		ushort port = 6667;
		string IP;
		string addressMask;
		string operPassword;
		string motdFileName;
	}
	IRC irc;

	struct HTTP
	{
		string address = null;
		ushort port = 80;
		string newsFileName;
	}
	HTTP http;

	struct Channel
	{
		string topic;
		int icon;
		string scheme;
	}
	Channel[string] channels;
}

Configuration configuration;

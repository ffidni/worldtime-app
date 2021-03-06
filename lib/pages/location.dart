import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:http/http.dart';
import 'loading.dart';
import 'dart:io';

class Location extends StatefulWidget {
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locationsWidget = [
    WorldTime('Africa/Abidjan', 'Abidjan', 'ci'),
    WorldTime('Africa/Algiers', 'Algiers', 'dz'),
    WorldTime('Africa/Bissau', 'Bissau', 'gw'),
    WorldTime('Africa/Cairo', 'Cairo', 'eg'),
    WorldTime('Africa/Casablanca', 'Casablanca', 'ma'),
    WorldTime('Africa/Ceuta', 'Ceuta', 'es'),
    WorldTime('Africa/El_Aaiun', 'El Aaiun', 'eh'),
    WorldTime('Africa/Johannesburg', 'Johannesburg', 'za'),
    WorldTime('Africa/Juba', 'Juba', 'ss'),
    WorldTime('Africa/Khartoum', 'Khartoum', 'sd'),
    WorldTime('Africa/Lagos', 'Lagos', 'ng'),
    WorldTime('Africa/Maputo', 'Maputo', 'mz'),
    WorldTime('Africa/Monrovia', 'Monrovia', 'lr'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'ke'),
    WorldTime('Africa/Ndjamena', 'Ndjamena', 'td'),
    WorldTime('Africa/Sao_Tome', 'Sao Tome', 'st'),
    WorldTime('Africa/Tripoli', 'Tripoli', 'ly'),
    WorldTime('Africa/Tunis', 'Tunis', 'tn'),
    WorldTime('Africa/Windhoek', 'Windhoek', 'na'),
    WorldTime('America/Adak', 'Adak', 'us'),
    WorldTime('America/Anchorage', 'Anchorage', 'us'),
    WorldTime('America/Araguaina', 'Araguaina', 'br'),
    WorldTime('America/Argentina/Buenos_Aires', 'Buenos Aires', 'ar'),
    WorldTime('America/Argentina/Catamarca', 'Catamarca', 'ar'),
    WorldTime('America/Argentina/Cordoba', 'Cordoba', 'ar'),
    WorldTime('America/Argentina/Jujuy', 'Jujuy', 'ar'),
    WorldTime('America/Argentina/La_Rioja', 'La Rioja', 'ar'),
    WorldTime('America/Argentina/Mendoza', 'Mendoza', 'ar'),
    WorldTime('America/Argentina/Rio_Gallegos', 'Rio Gallegos', 'ar'),
    WorldTime('America/Argentina/Salta', 'Salta', 'ar'),
    WorldTime('America/Argentina/San_Juan', 'San Juan', 'ar'),
    WorldTime('America/Argentina/San_Luis', 'San Luis', 'ar'),
    WorldTime('America/Argentina/Tucuman', 'Tucuman', 'ar'),
    WorldTime('America/Argentina/Ushuaia', 'Ushuaia', 'ar'),
    WorldTime('America/Asuncion', 'Asuncion', 'py'),
    WorldTime('America/Bahia', 'Bahia', 'br'),
    WorldTime('America/Bahia_Banderas', 'Bahia Banderas', 'mx'),
    WorldTime('America/Barbados', 'Barbados', 'bb'),
    WorldTime('America/Belem', 'Belem', 'br'),
    WorldTime('America/Belize', 'Belize', 'bz'),
    WorldTime('America/Boa_Vista', 'Boa Vista', 'br'),
    WorldTime('America/Bogota', 'Bogota', 'co'),
    WorldTime('America/Boise', 'Boise', 'us'),
    WorldTime('America/Cambridge_Bay', 'Cambridge Bay', 'ca'),
    WorldTime('America/Campo_Grande', 'Campo Grande', 'br'),
    WorldTime('America/Cancun', 'Cancun', 'mx'),
    WorldTime('America/Caracas', 'Caracas', 've'),
    WorldTime('America/Cayenne', 'Cayenne', 'gf'),
    WorldTime('America/Chicago', 'Chicago', 'us'),
    WorldTime('America/Chihuahua', 'Chihuahua', 'mx'),
    WorldTime('America/Costa_Rica', 'Costa Rica', 'cr'),
    WorldTime('America/Cuiaba', 'Cuiaba', 'br'),
    WorldTime('America/Danmarkshavn', 'Danmarkshavn', 'gl'),
    WorldTime('America/Dawson', 'Dawson', 'ca'),
    WorldTime('America/Dawson_Creek', 'Dawson Creek', 'ca'),
    WorldTime('America/Denver', 'Denver', 'us'),
    WorldTime('America/Detroit', 'Detroit', 'us'),
    WorldTime('America/Edmonton', 'Edmonton', 'ca'),
    WorldTime('America/Eirunepe', 'Eirunepe', 'br'),
    WorldTime('America/El_Salvador', 'El Salvador', 'sv'),
    WorldTime('America/Fort_Nelson', 'Fort Nelson', 'ca'),
    WorldTime('America/Fortaleza', 'Fortaleza', 'br'),
    WorldTime('America/Glace_Bay', 'Glace Bay', 'ca'),
    WorldTime('America/Goose_Bay', 'Goose Bay', 'ca'),
    WorldTime('America/Grand_Turk', 'Grand Turk', 'tc'),
    WorldTime('America/Guatemala', 'Guatemala', 'gt'),
    WorldTime('America/Guayaquil', 'Guayaquil', 'ec'),
    WorldTime('America/Guyana', 'Guyana', 'gy'),
    WorldTime('America/Halifax', 'Halifax', 'ca'),
    WorldTime('America/Havana', 'Havana', 'cu'),
    WorldTime('America/Hermosillo', 'Hermosillo', 'mx'),
    WorldTime('America/Indiana/Indianapolis', 'Indianapolis', 'us'),
    WorldTime('America/Indiana/Knox', 'Knox', 'us'),
    WorldTime('America/Indiana/Marengo', 'Marengo', 'us'),
    WorldTime('America/Indiana/Petersburg', 'Petersburg', 'us'),
    WorldTime('America/Indiana/Tell_City', 'Tell City', 'us'),
    WorldTime('America/Indiana/Vevay', 'Vevay', 'us'),
    WorldTime('America/Indiana/Vincennes', 'Vincennes', 'us'),
    WorldTime('America/Indiana/Winamac', 'Winamac', 'us'),
    WorldTime('America/Inuvik', 'Inuvik', 'ca'),
    WorldTime('America/Iqaluit', 'Iqaluit', 'ca'),
    WorldTime('America/Jamaica', 'Jamaica', 'jm'),
    WorldTime('America/Juneau', 'Juneau', 'us'),
    WorldTime('America/Kentucky/Louisville', 'Louisville', 'us'),
    WorldTime('America/Kentucky/Monticello', 'Monticello', 'us'),
    WorldTime('America/La_Paz', 'La Paz', 'bo'),
    WorldTime('America/Lima', 'Lima', 'pe'),
    WorldTime('America/Los_Angeles', 'Los Angeles', 'us'),
    WorldTime('America/Maceio', 'Maceio', 'br'),
    WorldTime('America/Managua', 'Managua', 'ni'),
    WorldTime('America/Manaus', 'Manaus', 'br'),
    WorldTime('America/Martinique', 'Martinique', 'mq'),
    WorldTime('America/Matamoros', 'Matamoros', 'mx'),
    WorldTime('America/Mazatlan', 'Mazatlan', 'mx'),
    WorldTime('America/Menominee', 'Menominee', 'us'),
    WorldTime('America/Merida', 'Merida', 'mx'),
    WorldTime('America/Metlakatla', 'Metlakatla', 'us'),
    WorldTime('America/Mexico_City', 'Mexico City', 'mx'),
    WorldTime('America/Miquelon', 'Miquelon', 'pm'),
    WorldTime('America/Moncton', 'Moncton', 'ca'),
    WorldTime('America/Monterrey', 'Monterrey', 'mx'),
    WorldTime('America/Montevideo', 'Montevideo', 'uy'),
    WorldTime('America/New_York', 'New York', 'us'),
    WorldTime('America/Nipigon', 'Nipigon', 'ca'),
    WorldTime('America/Nome', 'Nome', 'us'),
    WorldTime('America/Noronha', 'Noronha', 'br'),
    WorldTime('America/North_Dakota/Beulah', 'Beulah', 'us'),
    WorldTime('America/North_Dakota/Center', 'Center', 'us'),
    WorldTime('America/North_Dakota/New_Salem', 'New Salem', 'us'),
    WorldTime('America/Nuuk', 'Nuuk', 'gl'),
    WorldTime('America/Ojinaga', 'Ojinaga', 'mx'),
    WorldTime('America/Panama', 'Panama', 'pa'),
    WorldTime('America/Pangnirtung', 'Pangnirtung', 'ca'),
    WorldTime('America/Paramaribo', 'Paramaribo', 'sr'),
    WorldTime('America/Phoenix', 'Phoenix', 'us'),
    WorldTime('America/Port-au-Prince', 'Port-au-Prince', 'ht'),
    WorldTime('America/Porto_Velho', 'Porto Velho', 'br'),
    WorldTime('America/Puerto_Rico', 'Puerto Rico', 'pr'),
    WorldTime('America/Punta_Arenas', 'Punta Arenas', 'cl'),
    WorldTime('America/Rainy_River', 'Rainy River', 'ca'),
    WorldTime('America/Rankin_Inlet', 'Rankin Inlet', 'ca'),
    WorldTime('America/Recife', 'Recife', 'br'),
    WorldTime('America/Regina', 'Regina', 'ca'),
    WorldTime('America/Resolute', 'Resolute', 'ca'),
    WorldTime('America/Rio_Branco', 'Rio Branco', 'br'),
    WorldTime('America/Santarem', 'Santarem', 'br'),
    WorldTime('America/Santiago', 'Santiago', 'cl'),
    WorldTime('America/Santo_Domingo', 'Santo Domingo', 'do'),
    WorldTime('America/Sao_Paulo', 'Sao Paulo', 'br'),
    WorldTime('America/Scoresbysund', 'Scoresbysund', 'gl'),
    WorldTime('America/Sitka', 'Sitka', 'us'),
    WorldTime('America/St_Johns', 'St Johns', 'ca'),
    WorldTime('America/Swift_Current', 'Swift Current', 'ca'),
    WorldTime('America/Tegucigalpa', 'Tegucigalpa', 'hn'),
    WorldTime('America/Thule', 'Thule', 'gl'),
    WorldTime('America/Thunder_Bay', 'Thunder Bay', 'ca'),
    WorldTime('America/Tijuana', 'Tijuana', 'mx'),
    WorldTime('America/Toronto', 'Toronto', 'ca'),
    WorldTime('America/Vancouver', 'Vancouver', 'ca'),
    WorldTime('America/Whitehorse', 'Whitehorse', 'ca'),
    WorldTime('America/Winnipeg', 'Winnipeg', 'ca'),
    WorldTime('America/Yakutat', 'Yakutat', 'us'),
    WorldTime('America/Yellowknife', 'Yellowknife', 'ca'),
    WorldTime('Antarctica/Casey', 'Casey', 'aq'),
    WorldTime('Antarctica/Davis', 'Davis', 'aq'),
    WorldTime('Antarctica/Macquarie', 'Macquarie', 'au'),
    WorldTime('Antarctica/Mawson', 'Mawson', 'aq'),
    WorldTime('Antarctica/Palmer', 'Palmer', 'aq'),
    WorldTime('Antarctica/Rothera', 'Rothera', 'aq'),
    WorldTime('Antarctica/Troll', 'Troll', 'aq'),
    WorldTime('Antarctica/Vostok', 'Vostok', 'aq'),
    WorldTime('Asia/Almaty', 'Almaty', 'kz'),
    WorldTime('Asia/Amman', 'Amman', 'jo'),
    WorldTime('Asia/Anadyr', 'Anadyr', 'ru'),
    WorldTime('Asia/Aqtau', 'Aqtau', 'kz'),
    WorldTime('Asia/Aqtobe', 'Aqtobe', 'kz'),
    WorldTime('Asia/Ashgabat', 'Ashgabat', 'tm'),
    WorldTime('Asia/Atyrau', 'Atyrau', 'kz'),
    WorldTime('Asia/Baghdad', 'Baghdad', 'iq'),
    WorldTime('Asia/Baku', 'Baku', 'az'),
    WorldTime('Asia/Bangkok', 'Bangkok', 'th'),
    WorldTime('Asia/Barnaul', 'Barnaul', 'ru'),
    WorldTime('Asia/Beirut', 'Beirut', 'lb'),
    WorldTime('Asia/Bishkek', 'Bishkek', 'kg'),
    WorldTime('Asia/Brunei', 'Brunei', 'bn'),
    WorldTime('Asia/Chita', 'Chita', 'ru'),
    WorldTime('Asia/Choibalsan', 'Choibalsan', 'mn'),
    WorldTime('Asia/Colombo', 'Colombo', 'lk'),
    WorldTime('Asia/Damascus', 'Damascus', 'sy'),
    WorldTime('Asia/Dhaka', 'Dhaka', 'bd'),
    WorldTime('Asia/Dili', 'Dili', 'tl'),
    WorldTime('Asia/Dubai', 'Dubai', 'ae'),
    WorldTime('Asia/Dushanbe', 'Dushanbe', 'tj'),
    WorldTime('Asia/Famagusta', 'Famagusta', 'cy'),
    WorldTime('Asia/Gaza', 'Gaza', 'ps'),
    WorldTime('Asia/Hebron', 'Hebron', 'ps'),
    WorldTime('Asia/Ho_Chi_Minh', 'Ho Chi Minh', 'vn'),
    WorldTime('Asia/Hong_Kong', 'Hong Kong', 'hk'),
    WorldTime('Asia/Hovd', 'Hovd', 'mn'),
    WorldTime('Asia/Irkutsk', 'Irkutsk', 'ru'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'id'),
    WorldTime('Asia/Jayapura', 'Jayapura', 'id'),
    WorldTime('Asia/Jerusalem', 'Jerusalem', 'il'),
    WorldTime('Asia/Kabul', 'Kabul', 'af'),
    WorldTime('Asia/Kamchatka', 'Kamchatka', 'ru'),
    WorldTime('Asia/Karachi', 'Karachi', 'pk'),
    WorldTime('Asia/Kathmandu', 'Kathmandu', 'np'),
    WorldTime('Asia/Khandyga', 'Khandyga', 'ru'),
    WorldTime('Asia/Kolkata', 'Kolkata', 'in'),
    WorldTime('Asia/Krasnoyarsk', 'Krasnoyarsk', 'ru'),
    WorldTime('Asia/Kuala_Lumpur', 'Kuala Lumpur', 'my'),
    WorldTime('Asia/Kuching', 'Kuching', 'my'),
    WorldTime('Asia/Macau', 'Macau', 'mo'),
    WorldTime('Asia/Magadan', 'Magadan', 'ru'),
    WorldTime('Asia/Makassar', 'Makassar', 'id'),
    WorldTime('Asia/Manila', 'Manila', 'ph'),
    WorldTime('Asia/Nicosia', 'Nicosia', 'cy'),
    WorldTime('Asia/Novokuznetsk', 'Novokuznetsk', 'ru'),
    WorldTime('Asia/Novosibirsk', 'Novosibirsk', 'ru'),
    WorldTime('Asia/Omsk', 'Omsk', 'ru'),
    WorldTime('Asia/Oral', 'Oral', 'kz'),
    WorldTime('Asia/Pontianak', 'Pontianak', 'id'),
    WorldTime('Asia/Pyongyang', 'Pyongyang', 'kp'),
    WorldTime('Asia/Qatar', 'Qatar', 'qa'),
    WorldTime('Asia/Qostanay', 'Qostanay', 'kz'),
    WorldTime('Asia/Qyzylorda', 'Qyzylorda', 'kz'),
    WorldTime('Asia/Riyadh', 'Riyadh', 'sa'),
    WorldTime('Asia/Sakhalin', 'Sakhalin', 'ru'),
    WorldTime('Asia/Samarkand', 'Samarkand', 'uz'),
    WorldTime('Asia/Seoul', 'Seoul', 'kr'),
    WorldTime('Asia/Shanghai', 'Shanghai', 'cn'),
    WorldTime('Asia/Singapore', 'Singapore', 'sg'),
    WorldTime('Asia/Srednekolymsk', 'Srednekolymsk', 'ru'),
    WorldTime('Asia/Taipei', 'Taipei', 'tw'),
    WorldTime('Asia/Tashkent', 'Tashkent', 'uz'),
    WorldTime('Asia/Tbilisi', 'Tbilisi', 'ge'),
    WorldTime('Asia/Tehran', 'Tehran', 'ir'),
    WorldTime('Asia/Thimphu', 'Thimphu', 'bt'),
    WorldTime('Asia/Tokyo', 'Tokyo', 'jp'),
    WorldTime('Asia/Tomsk', 'Tomsk', 'ru'),
    WorldTime('Asia/Ulaanbaatar', 'Ulaanbaatar', 'mn'),
    WorldTime('Asia/Urumqi', 'Urumqi', 'cn'),
    WorldTime('Asia/Ust-Nera', 'Ust-Nera', 'ru'),
    WorldTime('Asia/Vladivostok', 'Vladivostok', 'ru'),
    WorldTime('Asia/Yakutsk', 'Yakutsk', 'ru'),
    WorldTime('Asia/Yangon', 'Yangon', 'mm'),
    WorldTime('Asia/Yekaterinburg', 'Yekaterinburg', 'ru'),
    WorldTime('Asia/Yerevan', 'Yerevan', 'am'),
    WorldTime('Atlantic/Azores', 'Azores', 'pt'),
    WorldTime('Atlantic/Bermuda', 'Bermuda', 'bm'),
    WorldTime('Atlantic/Canary', 'Canary', 'es'),
    WorldTime('Atlantic/Cape_Verde', 'Cape Verde', 'cv'),
    WorldTime('Atlantic/Faroe', 'Faroe', 'fo'),
    WorldTime('Atlantic/Madeira', 'Madeira', 'pt'),
    WorldTime('Atlantic/Reykjavik', 'Reykjavik', 'is'),
    WorldTime('Atlantic/South_Georgia', 'South Georgia', 'gs'),
    WorldTime('Atlantic/Stanley', 'Stanley', 'fk'),
    WorldTime('Australia/Adelaide', 'Adelaide', 'au'),
    WorldTime('Australia/Brisbane', 'Brisbane', 'au'),
    WorldTime('Australia/Broken_Hill', 'Broken Hill', 'au'),
    WorldTime('Australia/Darwin', 'Darwin', 'au'),
    WorldTime('Australia/Eucla', 'Eucla', 'au'),
    WorldTime('Australia/Hobart', 'Hobart', 'au'),
    WorldTime('Australia/Lindeman', 'Lindeman', 'au'),
    WorldTime('Australia/Lord_Howe', 'Lord Howe', 'au'),
    WorldTime('Australia/Melbourne', 'Melbourne', 'au'),
    WorldTime('Australia/Perth', 'Perth', 'au'),
    WorldTime('Australia/Sydney', 'Sydney', 'au'),
    WorldTime('CET', 'CET', 'null'),
    WorldTime('CST6CDT', 'CST6CDT', '??'),
    WorldTime('EET', 'EET', 'null'),
    WorldTime('EST', 'EST', 'null'),
    WorldTime('EST5EDT', 'EST5EDT', '??'),
    WorldTime('Etc/GMT', 'GMT', '??'),
    WorldTime('Etc/GMT+1', 'GMT+1', '??'),
    WorldTime('Etc/GMT+10', 'GMT+10', '??'),
    WorldTime('Etc/GMT+11', 'GMT+11', '??'),
    WorldTime('Etc/GMT+12', 'GMT+12', '??'),
    WorldTime('Etc/GMT+2', 'GMT+2', '??'),
    WorldTime('Etc/GMT+3', 'GMT+3', '??'),
    WorldTime('Etc/GMT+4', 'GMT+4', '??'),
    WorldTime('Etc/GMT+5', 'GMT+5', '??'),
    WorldTime('Etc/GMT+6', 'GMT+6', '??'),
    WorldTime('Etc/GMT+7', 'GMT+7', '??'),
    WorldTime('Etc/GMT+8', 'GMT+8', '??'),
    WorldTime('Etc/GMT+9', 'GMT+9', '??'),
    WorldTime('Etc/GMT-1', 'GMT-1', '??'),
    WorldTime('Etc/GMT-10', 'GMT-10', '??'),
    WorldTime('Etc/GMT-11', 'GMT-11', '??'),
    WorldTime('Etc/GMT-12', 'GMT-12', '??'),
    WorldTime('Etc/GMT-13', 'GMT-13', '??'),
    WorldTime('Etc/GMT-14', 'GMT-14', '??'),
    WorldTime('Etc/GMT-2', 'GMT-2', '??'),
    WorldTime('Etc/GMT-3', 'GMT-3', '??'),
    WorldTime('Etc/GMT-4', 'GMT-4', '??'),
    WorldTime('Etc/GMT-5', 'GMT-5', '??'),
    WorldTime('Etc/GMT-6', 'GMT-6', '??'),
    WorldTime('Etc/GMT-7', 'GMT-7', '??'),
    WorldTime('Etc/GMT-8', 'GMT-8', '??'),
    WorldTime('Etc/GMT-9', 'GMT-9', '??'),
    WorldTime('Etc/UTC', 'UTC', '??'),
    WorldTime('Europe/Amsterdam', 'Amsterdam', 'nl'),
    WorldTime('Europe/Andorra', 'Andorra', 'ad'),
    WorldTime('Europe/Astrakhan', 'Astrakhan', 'ru'),
    WorldTime('Europe/Athens', 'Athens', 'gr'),
    WorldTime('Europe/Belgrade', 'Belgrade', 'rs'),
    WorldTime('Europe/Berlin', 'Berlin', 'de'),
    WorldTime('Europe/Brussels', 'Brussels', 'be'),
    WorldTime('Europe/Bucharest', 'Bucharest', 'ro'),
    WorldTime('Europe/Budapest', 'Budapest', 'hu'),
    WorldTime('Europe/Chisinau', 'Chisinau', 'md'),
    WorldTime('Europe/Copenhagen', 'Copenhagen', 'dk'),
    WorldTime('Europe/Dublin', 'Dublin', 'ie'),
    WorldTime('Europe/Gibraltar', 'Gibraltar', 'gi'),
    WorldTime('Europe/Helsinki', 'Helsinki', 'fi'),
    WorldTime('Europe/Istanbul', 'Istanbul', 'tr'),
    WorldTime('Europe/Kaliningrad', 'Kaliningrad', 'ru'),
    WorldTime('Europe/Kiev', 'Kiev', 'ua'),
    WorldTime('Europe/Kirov', 'Kirov', 'ru'),
    WorldTime('Europe/Lisbon', 'Lisbon', 'pt'),
    WorldTime('Europe/London', 'London', 'gb'),
    WorldTime('Europe/Luxembourg', 'Luxembourg', 'lu'),
    WorldTime('Europe/Madrid', 'Madrid', 'es'),
    WorldTime('Europe/Malta', 'Malta', 'mt'),
    WorldTime('Europe/Minsk', 'Minsk', 'by'),
    WorldTime('Europe/Monaco', 'Monaco', 'mc'),
    WorldTime('Europe/Moscow', 'Moscow', 'ru'),
    WorldTime('Europe/Oslo', 'Oslo', 'no'),
    WorldTime('Europe/Paris', 'Paris', 'fr'),
    WorldTime('Europe/Prague', 'Prague', 'cz'),
    WorldTime('Europe/Riga', 'Riga', 'lv'),
    WorldTime('Europe/Rome', 'Rome', 'it'),
    WorldTime('Europe/Samara', 'Samara', 'ru'),
    WorldTime('Europe/Saratov', 'Saratov', 'ru'),
    WorldTime('Europe/Simferopol', 'Simferopol', 'ua'),
    WorldTime('Europe/Sofia', 'Sofia', 'bg'),
    WorldTime('Europe/Stockholm', 'Stockholm', 'se'),
    WorldTime('Europe/Tallinn', 'Tallinn', 'ee'),
    WorldTime('Europe/Tirane', 'Tirane', 'al'),
    WorldTime('Europe/Ulyanovsk', 'Ulyanovsk', 'ru'),
    WorldTime('Europe/Uzhgorod', 'Uzhgorod', 'ua'),
    WorldTime('Europe/Vienna', 'Vienna', 'at'),
    WorldTime('Europe/Vilnius', 'Vilnius', 'lt'),
    WorldTime('Europe/Volgograd', 'Volgograd', 'ru'),
    WorldTime('Europe/Warsaw', 'Warsaw', 'pl'),
    WorldTime('Europe/Zaporozhye', 'Zaporozhye', 'ua'),
    WorldTime('Europe/Zurich', 'Zurich', 'ch'),
    WorldTime('HST', 'HST', 'null'),
    WorldTime('Indian/Chagos', 'Chagos', 'io'),
    WorldTime('Indian/Christmas', 'Christmas', 'cx'),
    WorldTime('Indian/Cocos', 'Cocos', 'cc'),
    WorldTime('Indian/Kerguelen', 'Kerguelen', 'tf'),
    WorldTime('Indian/Mahe', 'Mahe', 'sc'),
    WorldTime('Indian/Maldives', 'Maldives', 'mv'),
    WorldTime('Indian/Mauritius', 'Mauritius', 'mu'),
    WorldTime('Indian/Reunion', 'Reunion', 're'),
    WorldTime('MET', 'MET', 'null'),
    WorldTime('MST', 'MST', 'null'),
    WorldTime('MST7MDT', 'MST7MDT', '??'),
    WorldTime('PST8PDT', 'PST8PDT', '??'),
    WorldTime('Pacific/Apia', 'Apia', 'ws'),
    WorldTime('Pacific/Auckland', 'Auckland', 'nz'),
    WorldTime('Pacific/Bougainville', 'Bougainville', 'pg'),
    WorldTime('Pacific/Chatham', 'Chatham', 'nz'),
    WorldTime('Pacific/Chuuk', 'Chuuk', 'fm'),
    WorldTime('Pacific/Easter', 'Easter', 'cl'),
    WorldTime('Pacific/Efate', 'Efate', 'vu'),
    WorldTime('Pacific/Fakaofo', 'Fakaofo', 'tk'),
    WorldTime('Pacific/Fiji', 'Fiji', 'fj'),
    WorldTime('Pacific/Funafuti', 'Funafuti', 'tv'),
    WorldTime('Pacific/Galapagos', 'Galapagos', 'ec'),
    WorldTime('Pacific/Gambier', 'Gambier', 'pf'),
    WorldTime('Pacific/Guadalcanal', 'Guadalcanal', 'sb'),
    WorldTime('Pacific/Guam', 'Guam', 'gu'),
    WorldTime('Pacific/Honolulu', 'Honolulu', 'us'),
    WorldTime('Pacific/Kanton', 'Kanton', '??'),
    WorldTime('Pacific/Kiritimati', 'Kiritimati', 'ki'),
    WorldTime('Pacific/Kosrae', 'Kosrae', 'fm'),
    WorldTime('Pacific/Kwajalein', 'Kwajalein', 'mh'),
    WorldTime('Pacific/Majuro', 'Majuro', 'mh'),
    WorldTime('Pacific/Marquesas', 'Marquesas', 'pf'),
    WorldTime('Pacific/Nauru', 'Nauru', 'nr'),
    WorldTime('Pacific/Niue', 'Niue', 'nu'),
    WorldTime('Pacific/Norfolk', 'Norfolk', 'nf'),
    WorldTime('Pacific/Noumea', 'Noumea', 'nc'),
    WorldTime('Pacific/Pago_Pago', 'Pago Pago', 'as'),
    WorldTime('Pacific/Palau', 'Palau', 'pw'),
    WorldTime('Pacific/Pitcairn', 'Pitcairn', 'pn'),
    WorldTime('Pacific/Pohnpei', 'Pohnpei', 'fm'),
    WorldTime('Pacific/Port_Moresby', 'Port Moresby', 'pg'),
    WorldTime('Pacific/Rarotonga', 'Rarotonga', 'ck'),
    WorldTime('Pacific/Tahiti', 'Tahiti', 'pf'),
    WorldTime('Pacific/Tarawa', 'Tarawa', 'ki'),
    WorldTime('Pacific/Tongatapu', 'Tongatapu', 'to'),
    WorldTime('Pacific/Wake', 'Wake', 'um'),
    WorldTime('Pacific/Wallis', 'Wallis', 'wf'),
    WorldTime('WET', 'WET', 'null')
  ];
  List<WorldTime> searchList = [];
  bool _isSearching = false;
  bool _isLoading = false;
  bool _isConnected = true;

  void searchLocation(String keyword) {
    searchList = [];
    for (WorldTime instance in locationsWidget) {
      if (instance.location.toLowerCase().contains(keyword.toLowerCase())) {
        searchList.add(instance);
      }
    }
    setState(() {
      searchList = searchList;
    });
  }

  void toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void updateTime(index) async {
    _isConnected = await isConnect();
    if (_isConnected) {
      toggleLoading();
      WorldTime instance = searchList[index];
      await instance.getTime();
      if (instance.now == false) {
        updateTime(index);
      }
      Navigator.pop(context, {
        "location": instance.location,
        "time": instance.now,
        "menuFlag": instance.menuFlag,
        "daytime": instance.isDaytime,
        "widget": instance,
      });
    } else {
      conHandler(_isConnected);
    }
  }

  void conHandler([isConnected = false]) async {
    _isConnected = isConnected ? isConnected : await isConnect();
    setState(() {
      _isConnected = _isConnected;
    });
    if (!_isConnected) {
      await Future.delayed(Duration(seconds: 1));
      conHandler();
    }
  }

  @override
  void initState() {
    super.initState();
    searchList = locationsWidget;
    conHandler();
  }

  void _toggleSearching() {
    setState(() {
      _isSearching = !_isSearching;
      searchList = locationsWidget;
    });
  }

  Future<bool> isConnect() async {
    try {
      await get(Uri.parse("https://example.com/"));
      return true;
    } on SocketException {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _isLoading
          ? null
          : AppBar(
              title: _isSearching
                  ? Container(
                      width: 230,
                      height: 45,
                      child: TextField(
                        onChanged: (text) {
                          searchLocation(text);
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(),
                          hintText: "Search location",
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: _toggleSearching,
                          ),
                        ),
                      ),
                    )
                  : Text("Select location"),
              actions: !_isSearching
                  ? <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: IconButton(
                          onPressed: (_isLoading || !_isConnected)
                              ? () {}
                              : _toggleSearching,
                          icon: Icon(
                            Icons.search,
                            size: 26.0,
                          ),
                        ),
                      ),
                    ]
                  : null,
              centerTitle: true,
              backgroundColor: Colors.blue[600],
            ),
      body: _isLoading
          ? loadingUi(_isConnected)
          : !_isConnected
              ? Center(child: Text("You are not conneted to any connection."))
              : ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 2),
                        child: ListTile(
                          onTap: () {
                            updateTime(index);
                          },
                          title: Text(searchList[index].location),
                          leading: CircleAvatar(
                            backgroundImage:
                                searchList[index].listFlag.contains("http")
                                    ? NetworkImage(searchList[index].listFlag)
                                    : AssetImage(searchList[index].listFlag),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

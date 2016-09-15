$(function(){
	$("#nationalitySearch").autocomplete({
		source: countries,
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox
			$(this).val(ui.item.label);
		},
		select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox and hidden field
			$(this).val(ui.item.label);
			$("#nationality").val(ui.item.value);
		}
	});
});

$(function(){
	$("#languageSearch").autocomplete({
		source: languages,
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox
			$(this).val(ui.item.label);
		},
		select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox and hidden field
			$(this).val(ui.item.label);
			$("#language").val(ui.item.value);
		}
	});
});

var countries = [ 
        	{label:"AFGHANISTAN",value:"AF"},
        	{label:"ALBANIA",value:"AL"},
        	{label:"ALGERIA",value:"DZ"},
        	{label:"AMERICAN SAMOA",value:"AS"},
        	{label:"ANDORRA",value:"AD"},
        	{label:"ANGOLA",value:"AO"},
        	{label:"ANGUILLA",value:"AI"},
        	{label:"ANTARCTICA",value:"AQ"},
        	{label:"ANTIGUA AND BARBUDA",value:"AG"},
        	{label:"ARGENTINA",value:"AR"},
        	{label:"ARMENIA",value:"AM"},
        	{label:"ARUBA",value:"AW"},
        	{label:"AUSTRALIA",value:"AU"},
        	{label:"AUSTRIA",value:"AT"},
        	{label:"AZERBAIJAN",value:"AZ"},
        	{label:"BAHAMAS",value:"BS"},
        	{label:"BAHRAIN",value:"BH"},
        	{label:"BANGLADESH",value:"BD"},
        	{label:"BARBADOS",value:"BB"},
        	{label:"BELGIUM",value:"BE"},
        	{label:"BELIZE",value:"BZ"},
        	{label:"BENIN",value:"BJ"},
        	{label:"BERMUDA",value:"BM"},
        	{label:"BHUTAN",value:"BT"},
        	{label:"BOLIVIA",value:"BO"},
        	{label:"BOSNIA HERCEGOVINA",value:"BA"},
        	{label:"BOTSWANA",value:"BW"},
        	{label:"BOUVET ISLAND",value:"BV"},
        	{label:"BRAZIL",value:"BR"},
        	{label:"BRITISH INDIAN OCEAN TERRITORY",value:"IO"},
        	{label:"BRUNEI DARUSSALAM",value:"BN"},
        	{label:"BULGARIA",value:"BG"},
        	{label:"BURKINA FASO",value:"BF"},
        	{label:"BURUNDI",value:"BI"},
        	{label:"BELARUS",value:"BY"},
        	{label:"CAMBODIA",value:"KH"},
        	{label:"CAMEROON",value:"CM"},
        	{label:"CANADA",value:"CA"},
        	{label:"CAPE VERDE",value:"CV"},
        	{label:"CAYMAN ISLANDS",value:"KY"},
        	{label:"CENTRAL AFRICAN REPUBLIC",value:"CF"},
        	{label:"CHAD",value:"TD"},
        	{label:"CHILE",value:"CL"},
        	{label:"CHINA",value:"CN"},
        	{label:"CHRISTMAS ISLAND",value:"CX"},
        	{label:"COCOS KEELING ISLANDS",value:"CC"},
        	{label:"COLOMBIA",value:"CO"},
        	{label:"COMOROS",value:"KM"},
        	{label:"CONGO",value:"CG"},
        	{label:"COOK ISLANDS",value:"CK"},
        	{label:"COSTA RICA",value:"CR"},
        	{label:"COTE DIVOIRE",value:"CI"},
        	{label:"CROATIA",value:"HR"},
        	{label:"CUBA",value:"CU"},
        	{label:"CYPRUS",value:"CY"},
        	{label:"CZECH REPUBLIC",value:"CZ"},
        	{label:"CZECHOSLOVAKIA",value:"CS"},
        	{label:"DENMARK",value:"DK"},
        	{label:"DJIBOUTI",value:"DJ"},
        	{label:"DOMINICA",value:"DM"},
        	{label:"DOMINICAN REPUBLIC",value:"DO"},
        	{label:"EAST TIMOR",value:"TP"},
        	{label:"ECUADOR",value:"EC"},
        	{label:"EGYPT",value:"EG"},
        	{label:"EL SALVADOR",value:"SV"},
        	{label:"EQUATORIAL GUINEA",value:"GQ"},
        	{label:"ESTONIA",value:"EE"},
        	{label:"ETHIOPIA",value:"ET"},
        	{label:"FALKLAND ISLANDS",value:"FK"},
        	{label:"FAROE ISLANDS",value:"FO"},
        	{label:"FIJI",value:"FJ"},
        	{label:"FINLAND",value:"FI"},
        	{label:"FRANCE",value:"FR"},
        	{label:"FRENCH GUIANA",value:"GF"},
        	{label:"FRENCH POLYNESIA",value:"PF"},
        	{label:"FRENCH SOUTHERN TERRITORIES",value:"TF"},
        	{label:"GABON",value:"GA"},
        	{label:"GAMBIA",value:"GM"},
        	{label:"GEORGIA",value:"GE"},
        	{label:"GERMANY",value:"DE"},
        	{label:"GHANA",value:"GH"},
        	{label:"GIBRALTAR",value:"GI"},
        	{label:"GREECE",value:"GR"},
        	{label:"GREENLAND",value:"GL"},
        	{label:"GRENADA",value:"GD"},
        	{label:"GUADELOUPE",value:"GP"},
        	{label:"GUAM",value:"GU"},
        	{label:"GUATEMALA",value:"GT"},
        	{label:"GUINEA",value:"GN"},
        	{label:"GUINEA-BISSAU",value:"GW"},
        	{label:"GUYANA",value:"GY"},
        	{label:"HAITI",value:"HT"},
        	{label:"HEARD AND MC DONALD ISLANDS",value:"HM"},
        	{label:"HONDURAS",value:"HN"},
        	{label:"HONG KONG",value:"HK"},
        	{label:"HUNGARY",value:"HU"},
        	{label:"ICELAND",value:"IS"},
        	{label:"INDIA",value:"IN"},
        	{label:"INDONESIA",value:"ID"},
        	{label:"IRAN ISLAMIC REPUBLIC OF",value:"IR"},
        	{label:"IRAQ",value:"IQ"},
        	{label:"IRELAND",value:"IE"},
        	{label:"ISRAEL",value:"IL"},
        	{label:"ITALY",value:"IT"},
        	{label:"JAMAICA",value:"JM"},
        	{label:"JAPAN",value:"JP"},
        	{label:"JORDAN",value:"JO"},
        	{label:"KAZAKHSTAN",value:"KZ"},
        	{label:"KENYA",value:"KE"},
        	{label:"KIRIBATI",value:"KI"},
        	{label:"NORTH KOREA",value:"KP"},
        	{label:"SOUTH KOREA",value:"KR"},
        	{label:"KUWAIT",value:"KW"},
        	{label:"KYRGYZSTAN",value:"KG"},
        	{label:"LAO PEOPLES DEMOCRATIC REPUBLIC",value:"LA"},
        	{label:"LATVIA",value:"LV"},
        	{label:"LEBANON",value:"LB"},
        	{label:"LESOTHO",value:"LS"},
        	{label:"LIBERIA",value:"LR"},
        	{label:"LIBYAN ARAB JAMAHIRIYA",value:"LY"},
        	{label:"LIECHTENSTEIN",value:"LI"},
        	{label:"LITHUANIA",value:"LT"},
        	{label:"LUXEMBOURG",value:"LU"},
        	{label:"MACAU",value:"MO"},
        	{label:"MADAGASCAR",value:"MG"},
        	{label:"MALAWI",value:"MW"},
        	{label:"MALAYSIA",value:"MY"},
        	{label:"MALDIVES",value:"MV"},
        	{label:"MALI",value:"ML"},
        	{label:"MALTA",value:"MT"},
        	{label:"MARSHALL ISLANDS",value:"MH"},
        	{label:"MARTINIQUE",value:"MQ"},
        	{label:"MAURITANIA",value:"MR"},
        	{label:"MAURITIUS",value:"MU"},
        	{label:"MEXICO",value:"MX"},
        	{label:"MICRONESIA",value:"FM"},
        	{label:"MOLDOVA, REPUBLIC OF",value:"MD"},
        	{label:"MONACO",value:"MC"},
        	{label:"MONGOLIA",value:"MN"},
        	{label:"MONTSERRAT",value:"MS"},
        	{label:"MOROCCO",value:"MA"},
        	{label:"MOZAMBIQUE",value:"MZ"},
        	{label:"MYANMAR",value:"MM"},
        	{label:"NAMIBIA",value:"NA"},
        	{label:"NAURU",value:"NR"},
        	{label:"NEPAL",value:"NP"},
        	{label:"NETHERLANDS",value:"NL"},
        	{label:"NETHERLANDS ANTILLES",value:"AN"},
        	{label:"NEUTRAL ZONE",value:"NT"},
        	{label:"NEW CALEDONIA",value:"NC"},
        	{label:"NEW ZEALAND",value:"NZ"},
        	{label:"NICARAGUA",value:"NI"},
        	{label:"NIGER",value:"NE"},
        	{label:"NIGERIA",value:"NG"},
        	{label:"NIUE",value:"NU"},
        	{label:"NORFOLK ISLAND",value:"NF"},
        	{label:"NORTHERN MARIANA ISLANDS",value:"MP"},
        	{label:"NORWAY",value:"NO"},
        	{label:"OMAN",value:"OM"},
        	{label:"PAKISTAN",value:"PK"},
        	{label:"PALAU",value:"PW"},
        	{label:"PANAMA",value:"PA"},
        	{label:"PAPUA NEW GUINEA",value:"PG"},
        	{label:"PARAGUAY",value:"PY"},
        	{label:"PERU",value:"PE"},
        	{label:"PHILIPPINES",value:"PH"},
        	{label:"PITCAIRN",value:"PN"},
        	{label:"POLAND",value:"PL"},
        	{label:"PORTUGAL",value:"PT"},
        	{label:"PUERTO RICO",value:"PR"},
        	{label:"QATAR",value:"QA"},
        	{label:"REUNION",value:"RE"},
        	{label:"ROMANIA",value:"RO"},
        	{label:"RUSSIAN FEDERATION",value:"RU"},
        	{label:"RWANDA",value:"RW"},
        	{label:"ST. HELENA",value:"SH"},
        	{label:"SAINT KITTS AND NEVIS ",value:"KN"},
        	{label:"SAINT LUCIA",value:"LC"},
        	{label:"ST. PIERRE AND MIQUELON ",value:"PM"},
        	{label:"SAINT VINCENT AND THE GRENADINES ",value:"VC"},
        	{label:"SAMOA",value:"WS"},
        	{label:"SAN MARINO",value:"SM"},
        	{label:"SAO TOME AND PRINCIPE",value:"ST"},
        	{label:"SAUDI ARABIA",value:"SA"},
        	{label:"SENEGAL",value:"SN"},
        	{label:"SEYCHELLES",value:"SC"},
        	{label:"SIERRA LEONE",value:"SL"},
        	{label:"SINGAPORE",value:"SG"},
        	{label:"SLOVAKIA",value:"SK"},
        	{label:"SLOVENIA",value:"SI"},
        	{label:"SOLOMON ISLANDS",value:"SB"},
        	{label:"SOMALIA",value:"SO"},
        	{label:"SOUTH AFRICA",value:"ZA"},
        	{label:"SPAIN",value:"ES"},
        	{label:"SRI LANKA",value:"LK"},
        	{label:"SUDAN",value:"SD"},
        	{label:"SURINAME",value:"SR"},
        	{label:"SVALBARD AND JAN MAYEN ISLANDS ",value:"SJ"},
        	{label:"SWAZILAND",value:"SZ"},
        	{label:"SWEDEN",value:"SE"},
        	{label:"SWITZERLAND",value:"CH"},
        	{label:"SYRIAN ARAB REPUBLIC",value:"SY"},
        	{label:"TAIWAN, PROVINCE OF CHINA",value:"TW"},
        	{label:"TAJIKISTAN",value:"TJ"},
        	{label:"TANZANIA, UNITED REPUBLIC OF",value:"TZ"},
        	{label:"THAILAND",value:"TH"},
        	{label:"TOGO",value:"TG"},
        	{label:"TOKELAU",value:"TK"},
        	{label:"TONGA",value:"TO"},
        	{label:"TRINIDAD AND TOBAGO",value:"TT"},
        	{label:"TUNISIA",value:"TN"},
        	{label:"TURKEY",value:"TR"},
        	{label:"TURKMENISTAN",value:"TM"},
        	{label:"TURKS AND CAICOS ISLANDS ",value:"TC"},
        	{label:"TUVALU",value:"TV"},
        	{label:"UGANDA",value:"UG"},
        	{label:"UKRAINE",value:"UA"},
        	{label:"UNITED ARAB EMIRATES",value:"AE"},
        	{label:"UNITED KINGDOM",value:"GB"},
        	{label:"UNITED STATES",value:"US"},
        	{label:"UNITED STATES MINOR OUTLYING ISLANDS",value:"UM"},
        	{label:"URUGUAY",value:"UY"},
        	{label:"USSR",value:"SU"},
        	{label:"UZBEKISTAN",value:"UZ"},
        	{label:"VANUATU",value:"VU"},
        	{label:"VATICAN CITY STATE HOLY SEE",value:"VA"},
        	{label:"VENEZUELA",value:"VE"},
        	{label:"VIET NAM",value:"VN"},
        	{label:"VIRGIN ISLANDS BRITISH",value:"VG"},
        	{label:"VIRGIN ISLANDS U.S.",value:"VI"},
        	{label:"WALLIS AND FUTUNA ISLANDS",value:"WF"},
        	{label:"WESTERN SAHARA",value:"EH"},
        	{label:"YEMEN, REPUBLIC OF",value:"YE"},
        	{label:"YUGOSLAVIA",value:"YU"},
        	{label:"ZAIRE",value:"ZR"},
        	{label:"ZAMBIA",value:"ZM"},
        	{label:"ZIMBABWE",value:"ZW"}
]; 

var languages = [
			{label:"Abkhazian", value : "AB"},
			{label:"Afar", value : "AA"},
			{label:"Afrikaans", value : "AF"},
			{label:"Albanian", value : "SQ"},
			{label:"Amharic", value : "AM"},
			{label:"Arabic", value : "AR"},
			{label:"Armenian", value : "HY"},
			{label:"Assamese", value : "AS"},
			{label:"Aymara", value : "AY"},
			{label:"Azerbaijani", value : "AZ"},
			{label:"Bashkir", value : "BA"},
			{label:"Basque", value : "EU"},
			{label:"Bengali, Bangla", value : "BN"},
			{label:"Bhutani", value : "DZ"},
			{label:"Bihari", value : "BH"},
			{label:"Bislama", value : "BI"},
			{label:"Breton", value : "BR"},
			{label:"Bulgarian", value : "BG"},
			{label:"Burmese", value : "MY"},
			{label:"Byelorussian", value : "BE"},
			{label:"Cambodian", value : "KM"},
			{label:"Catalan", value : "CA"},
			{label:"Chinese", value : "ZH"},
			{label:"Corsican", value : "CO"},
			{label:"Croatian", value : "HR"},
			{label:"Czech", value : "CS"},
			{label:"Danish", value : "DA"},
			{label:"Dutch", value : "NL"},
			{label:"English, American", value : "EN"},
			{label:"Esperanto", value : "EO"},
			{label:"Estonian", value : "ET"},
			{label:"Faeroese", value : "FO"},
			{label:"Fiji", value : "FJ"},
			{label:"Finnish", value : "FI"},
			{label:"French", value : "FR"},
			{label:"Frisian", value : "FY"},
			{label:"Gaelic (Scots Gaelic)", value : "GD"},
			{label:"Galician", value : "GL"},
			{label:"Georgian", value : "KA"},
			{label:"German", value : "DE"},
			{label:"Greek", value : "EL"},
			{label:"Greenlandic", value : "KL"},
			{label:"Guarani", value : "GN"},
			{label:"Gujarati", value : "GU"},
			{label:"Hausa", value : "HA"},
			{label:"Hebrew", value : "IW"},
			{label:"Hindi", value : "HI"},
			{label:"Hungarian", value : "HU"},
			{label:"Icelandic", value : "IS"},
			{label:"Indonesian", value : "IN"},
			{label:"Interlingua", value : "IA"},
			{label:"Interlingue", value : "IE"},
			{label:"Inupiak", value : "IK"},
			{label:"Irish", value : "GA"},
			{label:"Italian", value : "IT"},
			{label:"Japanese", value : "JA"},
			{label:"Javanese", value : "JW"},
			{label:"Kannada", value : "KN"},
			{label:"Kashmiri", value : "KS"},
			{label:"Kazakh", value : "KK"},
			{label:"Kinyarwanda", value : "RW"},
			{label:"Kirghiz", value : "KY"},
			{label:"Kirundi", value : "RN"},
			{label:"Korean", value : "KO"},
			{label:"Kurdish", value : "KU"},
			{label:"Laothian", value : "LO"},
			{label:"Latin", value : "LA"},
			{label:"Latvian, Lettish", value : "LV"},
			{label:"Lingala", value : "LN"},
			{label:"Lithuanian", value : "LT"},
			{label:"Macedonian", value : "MK"},
			{label:"Malagasy", value : "MG"},
			{label:"Malay", value : "MS"},
			{label:"Malayalam", value : "ML"},
			{label:"Maltese", value : "MT"},
			{label:"Maori", value : "MI"},
			{label:"Marathi", value : "MR"},
			{label:"Moldavian", value : "MO"},
			{label:"Mongolian", value : "MN"},
			{label:"Nauru", value : "NA"},
			{label:"Nepali", value : "NE"},
			{label:"Norwegian", value : "NO"},
			{label:"Occitan", value : "OC"},
			{label:"Oriya", value : "OR"},
			{label:"Oromo, Afan", value : "OM"},
			{label:"Pashto, Pushto", value : "PS"},
			{label:"Persian", value : "FA"},
			{label:"Polish", value : "PL"},
			{label:"Portuguese", value : "PT"},
			{label:"Punjabi", value : "PA"},
			{label:"Quechua", value : "QU"},
			{label:"Rhaeto-Romance", value : "RM"},
			{label:"Romanian", value : "RO"},
			{label:"Russian", value : "RU"},
			{label:"Samoan", value : "SM"},
			{label:"Sangro", value : "SG"},
			{label:"Sanskrit", value : "SA"},
			{label:"Serbian", value : "SR"},
			{label:"Serbo-Croatian", value : "SH"},
			{label:"Sesotho", value : "ST"},
			{label:"Setswana", value : "TN"},
			{label:"Shona", value : "SN"},
			{label:"Sindhi", value : "SD"},
			{label:"Singhalese", value : "SI"},
			{label:"Siswati", value : "SS"},
			{label:"Slovak", value : "SK"},
			{label:"Slovenian", value : "SL"},
			{label:"Somali", value : "SO"},
			{label:"Spanish", value : "ES"},
			{label:"Sudanese", value : "SU"},
			{label:"Swahili", value : "SW"},
			{label:"Swedish", value : "SV"},
			{label:"Tagalog", value : "TL"},
			{label:"Tajik", value : "TG"},
			{label:"Tamil", value : "TA"},
			{label:"Tatar", value : "TT"},
			{label:"Tegulu", value : "TE"},
			{label:"Thai", value : "TH"},
			{label:"Tibetan", value : "BO"},
			{label:"Tigrinya", value : "TI"},
			{label:"Tonga", value : "TO"},
			{label:"Tsonga", value : "TS"},
			{label:"Turkish", value : "TR"},
			{label:"Turkmen", value : "TK"},
			{label:"Twi", value : "TW"},
			{label:"Ukrainian", value : "UK"},
			{label:"Urdu", value : "UR"},
			{label:"Uzbek", value : "UZ"},
			{label:"Vietnamese", value : "VI"},
			{label:"Volapuk", value : "VO"},
			{label:"Welsh", value : "CY"},
			{label:"Wolof", value : "WO"},
			{label:"Xhosa", value : "XH"},
			{label:"Yiddish", value : "JI"},
			{label:"Yoruba", value : "YO"},
			{label:"Zulu", value : "ZU"}                 
];
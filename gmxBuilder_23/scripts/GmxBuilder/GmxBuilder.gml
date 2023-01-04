// Generated at 2023-01-04 14:10:42 (311ms) for v2.3.1+
/// @lint nullToAny true
// Feather disable all

function Gmx(_name, _text) constructor {
	/// Gmx(name:string, ?text:any)
	/// @param {string} name
	/// @param {any} ?text
	/// @returns {void}
	static name = undefined; /// @is {string}
	static getName = function() {
		return self.name;
	}
	static setName = function(_name) {
		self.name = _name;
	}
	static text = undefined; /// @is {string}
	static getText = function() {
		return self.text;
	}
	static setText = function(_text) {
		self.text = _text;
	}
	static children = undefined; /// @is {array<Gmx>}
	static attributes = undefined; /// @is {array<GmxAttribute>}
	static addChild = function(_child) {
		array_push(self.children, _child);
	}
	static addTextChild = function(_name, _value) {
		var _gmx = new Gmx(_name, _value);
		array_push(self.children, _gmx);
		return _gmx;
	}
	static addEmptyChild = function(_name) {
		var _gmx = new Gmx(_name, undefined);
		array_push(self.children, _gmx);
		return _gmx;
	}
	static addBoolChild = function(_name, _value) {
		var _gmx = new Gmx(_name, (_value ? "-1" : "0"));
		array_push(self.children, _gmx);
		return _gmx;
	}
	static addIntChild = function(_name, _value) {
		var _gmx = new Gmx(_name, _value);
		array_push(self.children, _gmx);
		return _gmx;
	}
	static addFloatChild = function(_name, _value) {
		var _gmx = new Gmx(_name, gmx_std_Std_stringify(_value));
		array_push(self.children, _gmx);
		return _gmx;
	}
	static insertBefore = function(_newNode, _refNode) {
		var _pos = gmx_std_gml_internal_ArrayImpl_indexOf(self.children, _refNode);
		if (_pos >= 0) array_insert(self.children, _pos, _newNode); else array_push(self.children, _newNode);
	}
	static removeChild = function(_q) {
		var _pos = gmx_std_gml_internal_ArrayImpl_indexOf(self.children, _q);
		if (_pos >= 0) {
			var _cur = self.children;
			var _next = Gmx_arrayDelete(_cur, _pos);
			if (_next != _cur) self.children = _next;
			return true;
		} else return false;
	}
	static removeChildAt = function(_pos) {
		var _cur = self.children;
		var _next = Gmx_arrayDelete(_cur, _pos);
		if (_next == _cur) return false;
		self.children = _next;
		return true;
	}
	static clearChildren = function() {
		self.children = [];
	}
	static find = function(_name) {
		var __g = 0;
		var __g1 = self.children;
		while (__g < array_length(__g1)) {
			var _q = __g1[__g];
			__g++;
			if (_q.name == _name) return _q;
		}
		return undefined;
	}
	static findText = function(_name) {
		var __g = 0;
		var __g1 = self.children;
		while (__g < array_length(__g1)) {
			var _q = __g1[__g];
			__g++;
			if (_q.name == _name) return _q.text;
		}
		return undefined;
	}
	static findAll = function(_name) {
		var _r = [];
		var __g = 0;
		var __g1 = self.children;
		while (__g < array_length(__g1)) {
			var _q = __g1[__g];
			__g++;
			if (_q.name == _name) array_push(_r, _q);
		}
		return _r;
	}
	static findRec = function(_name, _r) {
		if (false) show_debug_message(argument[1]);
		if (_r == undefined) _r = [];
		var __g = 0;
		var __g1 = self.children;
		while (__g < array_length(__g1)) {
			var _q = __g1[__g];
			__g++;
			if (_q.name == _name) array_push(_r, _q);
			_q.findRec(_name, _r);
		}
		return _r;
	}
	static getAttribute = function(_name) {
		var _arr = self.attributes;
		var _i = 0;
		for (var __g1 = array_length(_arr); _i < __g1; _i++) {
			var _item = _arr[_i];
			if (_item.name == _name) return _item.value;
		}
		return undefined;
	}
	static hasAttribute = function(_name) {
		var _arr = self.attributes;
		var _i = 0;
		for (var __g1 = array_length(_arr); _i < __g1; _i++) {
			if (_arr[_i].name == _name) return true;
		}
		return false;
	}
	static setAttribute = function(_name, _value) {
		var _arr = self.attributes;
		var _item;
		var _i = 0;
		for (var __g1 = array_length(_arr); _i < __g1; _i++) {
			_item = _arr[_i];
			if (_item.name == _name) {
				if (_value == undefined) {
					_value = "null";
				} else if (!is_string(_value)) {
					if (is_real(_value)) _value = _value; else _value = string(_value);
				}
				_item.value = _value;
				return 0;
			}
		}
		_item = { name: _name, value: _value }
		array_push(self.attributes, _item);
	}
	static removeAttribute = function(_name) {
		var _arr = self.attributes;
		var _item;
		var _i = 0;
		for (var __g1 = array_length(_arr); _i < __g1; _i++) {
			_item = _arr[_i];
			if (_item.name == _name) {
				self.attributes = Gmx_arrayDelete(_arr, _i);
				return true;
			}
		}
		return false;
	}
	static printRec = function(_buf, _tab) {
		buffer_write(_buf, buffer_u8, 60);
		buffer_write(_buf, buffer_text, self.name);
		var _attrs = self.attributes;
		var _i = 0;
		for (var __g1 = array_length(_attrs); _i < __g1; _i++) {
			var _attr = _attrs[_i];
			var _val = _attr.value;
			_val = gmx_std_StringTools_htmlEscape(_val, true);
			_val = string_replace_all(_val, "\r\n", "&#xA;");
			_val = string_replace_all(_val, "\n", "&#xA;");
			buffer_write(_buf, buffer_u8, 32);
			buffer_write(_buf, buffer_text, _attr.name);
			buffer_write(_buf, buffer_text, "=\"");
			buffer_write(_buf, buffer_text, _val);
			buffer_write(_buf, buffer_text, "\"");
		}
		var _children = self.children;
		var _len = array_length(_children);
		if (_len == 0 && self.text == undefined) {
			buffer_write(_buf, buffer_text, "/>");
			return 0;
		}
		buffer_write(_buf, buffer_u8, 62);
		if (_len > 0) {
			var _t1 = _tab + "  ";
			var _i = 0;
			for (var __g1 = _len; _i < __g1; _i++) {
				buffer_write(_buf, buffer_u8, 13);
				buffer_write(_buf, buffer_u8, 10);
				buffer_write(_buf, buffer_text, _t1);
				_children[_i].printRec(_buf, _t1);
			}
			buffer_write(_buf, buffer_u8, 13);
			buffer_write(_buf, buffer_u8, 10);
			buffer_write(_buf, buffer_text, _tab);
		} else buffer_write(_buf, buffer_text, gmx_std_StringTools_htmlEscape(self.text));
		buffer_write(_buf, buffer_text, "</");
		buffer_write(_buf, buffer_text, self.name);
		buffer_write(_buf, buffer_u8, 62);
	}
	static print = function() {
		var _buf = Gmx_printBuf;
		if (_buf == undefined) {
			_buf = buffer_create(1024, buffer_grow, 1);
			Gmx_printBuf = _buf;
		} else buffer_seek(_buf, buffer_seek_start, 0);
		self.printRec(_buf, "");
		buffer_write(_buf, buffer_u8, 0);
		buffer_seek(_buf, buffer_seek_start, 0);
		return buffer_read(_buf, buffer_string);
	}
	static printWithHeader = function() {
		var _buf = Gmx_printBuf;
		if (_buf == undefined) {
			_buf = buffer_create(1024, buffer_grow, 1);
			Gmx_printBuf = _buf;
		} else buffer_seek(_buf, buffer_seek_start, 0);
		buffer_write(_buf, buffer_text, "<!--This Document is generated by GameMaker, if you edit it by hand then you do so at your own risk!-->");
		buffer_write(_buf, buffer_u8, 13);
		buffer_write(_buf, buffer_u8, 10);
		self.printRec(_buf, "");
		buffer_write(_buf, buffer_u8, 13);
		buffer_write(_buf, buffer_u8, 10);
		buffer_write(_buf, buffer_u8, 0);
		buffer_seek(_buf, buffer_seek_start, 0);
		return buffer_read(_buf, buffer_string);
	}
	if (false) show_debug_message(argument[1]);
	self.attributes = [];
	self.children = [];
	self.name = _name;
	if (_text == undefined) {
		self.text = undefined;
	} else if (is_string(_text)) {
		self.text = _text;
	} else self.text = string(_text);
	//
}

function Gmx_arrayDelete(_arr, _pos) {
	// Gmx_arrayDelete(arr:array<T>, pos:int)->array<T>
	var _len = array_length(_arr);
	if (_pos < 0 || _pos >= _len) return _arr;
	var _next = array_create(_len - 1, 0);
	array_copy(_next, 0, _arr, 0, _pos);
	array_copy(_next, _pos, _arr, _pos + 1, _len - _pos - 1);
	return _next;
}

function gmx_std_Std_stringify(_value) {
	// gmx_std_Std_stringify(value:any)->string
	if (_value == undefined) return "null";
	if (is_string(_value)) return _value;
	var _n, _i, _s;
	if (is_struct(_value)) {
		var _e = _value[$"__enum__"];
		if (_e == undefined) return string(_value);
		var _ects = _e.constructors;
		if (_ects != undefined) {
			_i = _value.__enumIndex__;
			if (_i >= 0 && _i < array_length(_ects)) _s = _ects[_i]; else _s = "?";
		} else {
			_s = instanceof(_value);
			if (string_copy(_s, 1, 3) == "mc_") _s = string_delete(_s, 1, 3);
			_n = string_length(_e.name);
			if (string_copy(_s, 1, _n) == _e.name) _s = string_delete(_s, 1, _n + 1);
		}
		_s += "(";
		var _fields = _value.__enumParams__;
		_n = array_length(_fields);
		for (_i = -1; ++_i < _n; _s += gmx_std_Std_stringify(_value[$ _fields[_i]])) {
			if (_i > 0) _s += ", ";
		}
		return _s + ")";
	}
	if (is_real(_value)) {
		_s = string_format(_value, 0, 16);
		if (os_browser != browser_not_a_browser) {
			_n = string_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_ord_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		} else {
			_n = string_byte_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_byte_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		}
		return string_copy(_s, 1, _i);
	}
	return string(_value);
}

function gmx_std_StringTools_htmlEscape(_s, _quotes) {
	// gmx_std_StringTools_htmlEscape(s:string, quotes:bool = false)->string
	if (_quotes == undefined) _quotes = false;
	if (false) show_debug_message(argument[1]);
	_s = string_replace_all(_s, "&", "&amp;");
	_s = string_replace_all(_s, "<", "&lt;");
	_s = string_replace_all(_s, ">", "&gt;");
	if (_quotes) {
		_s = string_replace_all(_s, "\"", "&quot;");
		_s = string_replace_all(_s, "'", "&#039;");
	}
	return _s;
}

function gmx_std_gml_NativeTypeHelper_isNumber(_v) {
	// gmx_std_gml_NativeTypeHelper_isNumber(v:any)->bool
	return (is_real(_v) || is_bool(_v) || is_int32(_v)) || is_int64(_v);
}

function gmx_std_gml_internal_ArrayImpl_indexOf(_arr, _v, _i) {
	// gmx_std_gml_internal_ArrayImpl_indexOf(arr:array<T>, v:T, i:int = 0)->int
	if (_i == undefined) _i = 0;
	if (false) show_debug_message(argument[2]);
	var _len = array_length(_arr);
	if (_i < 0) {
		_i += _len;
		if (_i < 0) _i = 0;
	}
	while (_i < _len) {
		if (_arr[_i] == _v) return _i;
		_i++;
	}
	return -1;
}

globalvar Gmx_printBuf; /// @is {buffer}
Gmx_printBuf = undefined;


/// @typedef {any} GmxAttribute